// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messaged_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagedProfile _$MessagedProfileFromJson(Map<String, dynamic> json) =>
    MessagedProfile(
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      latestMessage: json['latestMessage'] as String?,
      latestMessageSendAt: json['latestMessageSendAt'] == null
          ? null
          : DateTime.parse(json['latestMessageSendAt'] as String),
      messageStatus: json['messageStatus'] as String?,
      unreadCount: (json['unreadCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MessagedProfileToJson(MessagedProfile instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'latestMessage': instance.latestMessage,
      'latestMessageSendAt': instance.latestMessageSendAt?.toIso8601String(),
      'messageStatus': instance.messageStatus,
      'unreadCount': instance.unreadCount,
    };
