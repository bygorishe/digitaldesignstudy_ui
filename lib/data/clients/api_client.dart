import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../domain/model/user.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET("/api/User/GetCurrentUser")
  Future<User?> getUser();
}
