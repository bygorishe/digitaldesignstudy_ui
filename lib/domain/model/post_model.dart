import 'package:digitaldesignstudy_ui/domain/model/post_content.dart';
import 'package:digitaldesignstudy_ui/domain/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  String id;
  String? description;
  User author;
  String createdDate;
  List<PostContent> contens;

  PostModel({
    required this.id,
    required this.createdDate,
    this.description,
    required this.author,
    required this.contens,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
