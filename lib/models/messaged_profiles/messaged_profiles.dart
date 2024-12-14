import 'package:json_annotation/json_annotation.dart';

import 'messaged_profile.dart';

part 'messaged_profiles.g.dart';

@JsonSerializable()
class MessagedProfiles {
  List<MessagedProfile>? messagedProfiles;

  MessagedProfiles({this.messagedProfiles});

  factory MessagedProfiles.fromJson(Map<String, dynamic> json) {
    return _$MessagedProfilesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MessagedProfilesToJson(this);
}
