// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messaged_profiles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagedProfiles _$MessagedProfilesFromJson(Map<String, dynamic> json) =>
    MessagedProfiles(
      messagedProfiles: (json['messagedProfiles'] as List<dynamic>?)
          ?.map((e) => MessagedProfile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessagedProfilesToJson(MessagedProfiles instance) =>
    <String, dynamic>{
      'messagedProfiles': instance.messagedProfiles,
    };
