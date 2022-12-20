import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String id;
  String name;
  String? fullName;
  String? about;
  String email;
  int? postsCount;
  int? followersCount;
  int? subscribtionsCount;
  DateTime birthDate;
  DateTime registrateDate;
  String? avatarLink;

  UserModel({
    required this.id,
    required this.name,
    this.fullName,
    this.about,
    required this.email,
    required this.birthDate,
    required this.registrateDate,
    this.avatarLink,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
