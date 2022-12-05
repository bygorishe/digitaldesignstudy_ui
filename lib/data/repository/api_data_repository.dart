import 'package:digitaldesignstudy_ui/data/clients/auth_client.dart';
import 'package:digitaldesignstudy_ui/domain/model/refresh_token_request.dart';
import 'package:digitaldesignstudy_ui/domain/model/token_request.dart';
import 'package:digitaldesignstudy_ui/domain/model/token_response.dart';
import 'package:digitaldesignstudy_ui/domain/repository/api_repository.dart';

class ApiDataRepository extends ApiRepository {
  final AuthClient _auth;
  ApiDataRepository(this._auth);

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
}
