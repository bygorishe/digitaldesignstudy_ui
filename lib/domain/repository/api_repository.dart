import 'dart:io';

import 'package:digitaldesignstudy_ui/domain/model/attach_meta.dart';
import 'package:digitaldesignstudy_ui/domain/model/post_model.dart';
import 'package:digitaldesignstudy_ui/domain/model/token_response.dart';
import 'package:digitaldesignstudy_ui/domain/model/user.dart';

abstract class ApiRepository {
  Future<TokenResponse?> getToken(
      {required String login, required String password});
  Future<TokenResponse?> refreshToken(String refreshToken);
  Future<User?> getUser();
  Future<List<PostModel>> getPosts(int skip, int take);
  Future<List<AttachMeta>> uploadTemp({required List<File> files});
  Future addAvatarToUser(AttachMeta model);
}
