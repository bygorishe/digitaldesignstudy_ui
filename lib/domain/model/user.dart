import 'package:digitaldesignstudy_ui/domain/db_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User implements DbModel {
  @override
  final String id;
  final String name;
  final String? fullName;
  final String? about;
  final String email;
  final DateTime birthDate;
  final DateTime registrateDate;
  final String? avatarLink;

  User({
    required this.id,
    required this.name,
    this.fullName,
    this.about,
    required this.email,
    required this.birthDate,
    required this.registrateDate,
    this.avatarLink,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromMap(Map<String, dynamic> map) => _$UserFromJson(map);
  @override
  Map<String, dynamic> toMap() => _$UserToJson(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.birthDate == birthDate &&
        other.registrateDate == registrateDate &&
        other.avatarLink == avatarLink;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        birthDate.hashCode ^
        registrateDate.hashCode ^
        avatarLink.hashCode;
  }
}
