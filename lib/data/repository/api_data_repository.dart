import 'package:digitaldesignstudy_ui/data/clients/api_client.dart';
import 'package:digitaldesignstudy_ui/data/clients/auth_client.dart';
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
  Future<TokenResponse?> refreshToken(String refreshToken) async {
    await _auth.refreshToken(RefreshTokenRequest(refreshToken: refreshToken));
  }
}
