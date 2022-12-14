import 'package:digitaldesignstudy_ui/domain/model/refresh_token_request.dart';
import 'package:digitaldesignstudy_ui/domain/model/token_request.dart';
import 'package:digitaldesignstudy_ui/domain/model/token_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_client.g.dart';

@RestApi()
abstract class AuthClient {
  factory AuthClient(Dio dio, {String? baseUrl}) = _AuthClient;

  @POST("/api/Auth/Token")
  Future<TokenResponse?> getToken(@Body() TokenRequest body);

  @POST("/api/Auth/RefreshToken")
  Future<TokenResponse?> refreshToken(@Body() RefreshTokenRequest body);
}
