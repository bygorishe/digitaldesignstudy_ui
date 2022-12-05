import 'package:digitaldesignstudy_ui/domain/model/token_response.dart';

abstract class ApiRepository {
  Future<TokenResponse?> getToken(
      {required String login, required String password});
  // Future<TokenResponse?> refreshToken(String refreshToken);
  // Future<User?> getUser();
}
