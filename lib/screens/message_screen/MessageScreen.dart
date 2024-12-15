import 'package:flutter/material.dart';
import 'package:greenery/api/data/Url.dart';
import 'package:greenery/api/data/message.dart';
import 'package:greenery/core/constants/constants.dart';
import 'package:greenery/models/chat_model/message.dart';
import 'package:greenery/models/messaged_profiles/messaged_profile.dart';
import 'package:greenery/models/messaged_profiles/messaged_profiles.dart';
import 'package:greenery/screens/message_screen/ChatScreen.dart';
import 'package:greenery/screens/widgets/MessageStatusIcon.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  bool isLoading = true;

  final ValueNotifier<MessagedProfiles> messagedProfilesNotifier =
      ValueNotifier(MessagedProfiles());
  late IO.Socket socket;

  @override
  void initState() {
    connectSocket();
    super.initState();
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  void connectSocket() async {
    setState(() {
      isLoading = true;
    });
    messagedProfilesNotifier.value = await MessageDB().getMessagedProfiles();
    setState(() {
      isLoading = false;
    });
    final sharedPref = await SharedPreferences.getInstance();
    final authorization = sharedPref.getString(TOKEN);
    print(authorization);
    socket = IO.io(
      "${Url().baseUrl}chat",
      IO.OptionBuilder().setTransports(['websocket']).setExtraHeaders(
          {'authorization': authorization}).build(),
    );
    socket.connect();
    socket.on('ready', (_) {
      print('Socket is ready');
    });
    socket.on('newMessage', (newMessage) async {
      final message = Message.fromJson(newMessage);
      bool updated = false;
      final updatedProfiles =
          messagedProfilesNotifier.value.messagedProfiles?.map((profile) {
                if (profile.profile?.id == message.sender) {
                  updated = true;
                  return MessagedProfile(
                    profile: profile.profile,
                    latestMessage: message.message,
                    latestMessageSendAt: message.sendAt,
                    messageStatus: message.status,
                    unreadCount: (profile.unreadCount ?? 0) + 1,
                  );
                } else {
                  print("here");
                  return profile;
                }
              }).toList() ??
              [];
      if (updated) {
        messagedProfilesNotifier.value =
            await MessageDB().getMessagedProfiles();
      } else {
        messagedProfilesNotifier.value =
            MessagedProfiles(messagedProfiles: updatedProfiles);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message"),
      ),
      body: RefreshIndicator(
        onRefresh: () => _fetchMessagedProfiles(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Messages',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: messagedProfilesNotifier,
                builder: (context, value, child) {
                  if (value.messagedProfiles != null &&
                      value.messagedProfiles!.isNotEmpty) {
                    return ListView.separated(
                      itemCount: value.messagedProfiles!.length,
                      itemBuilder: (context, index) {
                        final messagedProfile = value.messagedProfiles![index];
                        final time =
                            timeAgo(messagedProfile.latestMessageSendAt!);
                        return _buildMessageTile(
                          messagedProfile.profile!.firstName ?? 'firstName',
                          messagedProfile.profile!.profilePic ?? '',
                          messagedProfile.latestMessage ?? 'message',
                          messagedProfile.messageStatus ?? '',
                          time,
                          messagedProfile.unreadCount ?? 0,
                          () async {
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => ChatScreen(
                                  socket: socket,
                                  profileId: messagedProfile.profile!.id ?? '',
                                  profilePic:
                                      messagedProfile.profile!.profilePic ?? '',
                                  firstName:
                                      messagedProfile.profile!.firstName ??
                                          'firstName',
                                ),
                              ),
                            );
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Padding(
                          padding: EdgeInsets.only(left: 26, right: 26),
                          child: Divider(),
                        );
                      },
                    );
                  } else if (isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text(
                        'Start a new chat...',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _fetchMessagedProfiles() async {
    try {
      setState(() {
        isLoading = true;
      });
      const maxRetries = 3;
      int retryCount = 0;
      bool retry = true;
      while (retry && retryCount < maxRetries) {
        retry = false;
        try {
          final result = await MessageDB().getMessagedProfiles();
          messagedProfilesNotifier.value = result;
        } catch (e) {
          print('Error fetching profiles: $e');
          retry = true;
          retryCount++;
          await Future.delayed(Duration(seconds: retryCount));
        }
      }
    } catch (e) {
      print('Error fetching profiles: $e');
    } finally {
      setState(() {
        isLoading = true;
      });
    }
  }

  Widget _buildMessageTile(
    String name,
    String profilePic,
    String message,
    String messageStatus,
    String time,
    int unreadCount,
    Function onClick,
  ) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
            '${Url().baseUrl}$profilePic',
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => onClick(),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              title: Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      MessageStatusIcon(messageStatus, 18),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          message,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onClick(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              if (unreadCount > 0)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    unreadCount.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

String timeAgo(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inMinutes < 1) {
    return 'Just now';
  } else if (difference.inHours < 1) {
    return '${difference.inMinutes} min ago';
  } else if (difference.inDays < 1) {
    return '${difference.inHours} hours ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays < 30) {
    final weeks = (difference.inDays / 7).floor();
    return '$weeks week${weeks > 1 ? 's' : ''} ago';
  } else if (difference.inDays < 365) {
    final months = (difference.inDays / 30).floor();
    return '$months month${months > 1 ? 's' : ''} ago';
  } else {
    final years = (difference.inDays / 365).floor();
    return '$years year${years > 1 ? 's' : ''} ago';
  }
}
