import 'package:json_annotation/json_annotation.dart';

import 'conversation.dart';

part 'chat_model.g.dart';

@JsonSerializable()
class ChatModel {
  List<Conversation>? conversation;

  ChatModel({this.conversation});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return _$ChatModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChatModelToJson(this);
}
