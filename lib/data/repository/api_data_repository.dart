import 'dart:io';

import 'package:digitaldesignstudy_ui/data/clients/api_client.dart';
import 'package:digitaldesignstudy_ui/data/clients/auth_client.dart';
import 'package:digitaldesignstudy_ui/domain/model/attach_meta.dart';
import 'package:digitaldesignstudy_ui/domain/model/post_model.dart';
import 'package:digitaldesignstudy_ui/domain/model/refresh_token_request.dart';
import 'package:digitaldesignstudy_ui/domain/model/token_request.dart';
import 'package:digitaldesignstudy_ui/domain/model/token_response.dart';
import 'package:digitaldesignstudy_ui/domain/model/user.dart';
import 'package:digitaldesignstudy_ui/domain/repository/api_repository.dart';

class ApiDataRepository extends ApiRepository {
  final AuthClient _auth;
  final ApiClient _api;
  ApiDataRepository(this._auth, this._api);

  @override
  Future<TokenResponse?> getToken({
    required String login,
    required String password,
  }) async {
    return await _auth.getToken(TokenRequest(
      login: login,
      pass: password,
    ));
  }

  @override
  Future<User?> getUser() => _api.getUser();

  @override
  Future<List<PostModel>> getPosts(int skip, int take) =>
      _api.getPosts(skip, take);

  @override
  Future<TokenResponse?> refreshToken(String refreshToken) async {
    await _auth.refreshToken(RefreshTokenRequest(refreshToken: refreshToken));
  }

  @override
  Future<List<AttachMeta>> uploadTemp({required List<File> files}) =>
      _api.uploadTemp(files: files);

  @override
  Future addAvatarToUser(AttachMeta model) => _api.addAvatarToUser(model);
}
