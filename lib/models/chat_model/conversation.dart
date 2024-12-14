import 'package:json_annotation/json_annotation.dart';

import 'message.dart';

part 'conversation.g.dart';

@JsonSerializable()
class Conversation {
  String? date;
  List<Message>? messages;

  Conversation({this.date, this.messages});

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return _$ConversationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConversationToJson(this);
}
