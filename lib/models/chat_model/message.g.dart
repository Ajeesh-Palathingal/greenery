// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      id: json['_id'] as String?,
      sender: json['sender'] as String?,
      receiver: json['receiver'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
      sendAt: json['sendAt'] == null
          ? null
          : DateTime.parse(json['sendAt'] as String),
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      '_id': instance.id,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'message': instance.message,
      'status': instance.status,
      'sendAt': instance.sendAt?.toIso8601String(),
      '__v': instance.v,
    };
