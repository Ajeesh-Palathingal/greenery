import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  @JsonKey(name: '_id')
  String? id;
  String? sender;
  String? receiver;
  String? message;
  String? status;
  DateTime? sendAt;
  @JsonKey(name: '__v')
  int? v;

  Message({
    this.id,
    this.sender,
    this.receiver,
    this.message,
    this.status,
    this.sendAt,
    this.v,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return _$MessageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
