import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:greenery/api/data/Url.dart';
import 'package:greenery/models/chat_model/chat_model.dart';
import 'package:greenery/models/chat_model/message.dart';
import 'package:greenery/models/messaged_profiles/messaged_profiles.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MessageApiCalls {
  Future<MessagedProfiles> getMessagedProfiles();
  Future<Message> sendMessage(String profileId, String message);
  Future<ChatModel> getChats(String profileId);
}

class MessageDB extends MessageApiCalls {
  final Dio dio = Dio();
  final Url url = Url();
  late SharedPreferences _sharedPref;
  late String _token;
  bool _initialized = false;

  MessageDB() {
    _initialize();
  }

  Future<void> _initialize() async {
    _sharedPref = await SharedPreferences.getInstance();
    _token = _sharedPref.getString('TOKEN') ?? '';
    dio.options = BaseOptions(
      baseUrl: url.baseUrl,
      responseType: ResponseType.plain,
      validateStatus: (status) => status! < 500,
      headers: {
        "authorization": _token,
      },
    );
    _initialized = true;
  }

  @override
  Future<MessagedProfiles> getMessagedProfiles() async {
    if (!_initialized) {
      await _initialize();
    }
    try {
      print(url.messagedProfiles);
      final result = await dio.get(url.messagedProfiles);
      if (result.data != null && result.statusCode == 200) {
        final resultAsJson = jsonDecode(result.data);
        final profiles = MessagedProfiles.fromJson(resultAsJson);
        return profiles;
      } else {
        throw Exception('Failed to load profiles: ${result.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load profiles');
    }
  }

  @override
  Future<ChatModel> getChats(String profileId) async {
    if (!_initialized) {
      await _initialize();
    }
    try {
      print(url.conversation);
      final result = await dio.get('${url.conversation}/$profileId');
      if (result.data != null && result.statusCode == 200) {
        final resultAsJson = jsonDecode(result.data);
        final profiles = ChatModel.fromJson(resultAsJson);
        return profiles;
      } else {
        throw Exception('Failed to load chats: ${result.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to load chats');
    }
  }

  @override
  Future<Message> sendMessage(String profileId, String message) async {
    if (!_initialized) {
      await _initialize();
    }
    try {
      print(url.sendMessage);
      final result = await dio.post(
        url.sendMessage,
        data: {'profileId': profileId, 'message': message},
      );
      if (result.data != null && result.statusCode == 201) {
        final resultAsJson = jsonDecode(result.data);
        final newMessage = Message.fromJson(resultAsJson);
        return newMessage;
      } else {
        throw Exception('Failed to send message: ${result.statusCode}');
      }
    } catch (e) {
      print(e);
      throw Exception('Failed to send message');
    }
  }
}
