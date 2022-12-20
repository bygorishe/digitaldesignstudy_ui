// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      fullName: json['fullName'] as String?,
      about: json['about'] as String?,
      email: json['email'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      registrateDate: DateTime.parse(json['registrateDate'] as String),
      avatarLink: json['avatarLink'] as String?,
    )
      ..postsCount = json['postsCount'] as int?
      ..followersCount = json['followersCount'] as int?
      ..subscribtionsCount = json['subscribtionsCount'] as int?;

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fullName': instance.fullName,
      'about': instance.about,
      'email': instance.email,
      'postsCount': instance.postsCount,
      'followersCount': instance.followersCount,
      'subscribtionsCount': instance.subscribtionsCount,
      'birthDate': instance.birthDate.toIso8601String(),
      'registrateDate': instance.registrateDate.toIso8601String(),
      'avatarLink': instance.avatarLink,
    };
