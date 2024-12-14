import 'package:json_annotation/json_annotation.dart';

import 'profile.dart';

part 'messaged_profile.g.dart';

@JsonSerializable()
class MessagedProfile {
  Profile? profile;
  String? latestMessage;
  DateTime? latestMessageSendAt;
  String? messageStatus;
  int? unreadCount;

  MessagedProfile({
    this.profile,
    this.latestMessage,
    this.latestMessageSendAt,
    this.messageStatus,
    this.unreadCount,
  });

  factory MessagedProfile.fromJson(Map<String, dynamic> json) {
    return _$MessagedProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessagedProfileToJson(this);
}
