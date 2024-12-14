import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  @JsonKey(name: '_id')
  String? id;
  String? username;
  String? profilePic;

  Profile({this.id, this.username, this.profilePic});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return _$ProfileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
