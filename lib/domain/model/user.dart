import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String name;
  final String fullName;
  final String about;
  final String email;
  final String birthDate;
  final String registrateDate;
  final String avatarLink;

  User({
    required this.id,
    required this.name,
    required this.fullName,
    required this.about,
    required this.email,
    required this.birthDate,
    required this.registrateDate,
    required this.avatarLink,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
