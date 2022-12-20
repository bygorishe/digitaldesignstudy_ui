// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: json['id'] as String,
      createdDate: json['createdDate'] as String,
      description: json['description'] as String?,
      author: User.fromJson(json['author'] as Map<String, dynamic>),
      contens: (json['contens'] as List<dynamic>)
          .map((e) => PostContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'author': instance.author,
      'createdDate': instance.createdDate,
      'contens': instance.contens,
    };
