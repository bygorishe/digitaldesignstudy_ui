import 'package:json_annotation/json_annotation.dart';
import 'package:digitaldesignstudy_ui/domain/db_model.dart';

part 'post.g.dart';

@JsonSerializable()
class Post implements DbModel {
  @override
  final String id;
  final String description;
  final String createdDate;
  final String? userId;
  Post({
    required this.id,
    required this.description,
    required this.createdDate,
    this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  factory Post.fromMap(Map<String, dynamic> map) => _$PostFromJson(map);
  @override
  Map<String, dynamic> toMap() => _$PostToJson(this);

  Post copyWith({
    String? id,
    String? description,
    String? createdDate,
    String? authorId,
  }) {
    return Post(
      id: id ?? this.id,
      description: description ?? this.description,
      createdDate: createdDate ?? this.createdDate,
      userId: authorId ?? this.userId,
    );
  }
}
