// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as String,
      description: json['description'] as String,
      createdDate: json['createdDate'] as String,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'createdDate': instance.createdDate,
      'userId': instance.userId,
    };
