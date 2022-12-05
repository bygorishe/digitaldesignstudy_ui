import 'package:digitaldesignstudy_ui/data/clients/auth_client.dart';
import 'package:dio/dio.dart';

String baseUrl = "http://10.0.2.2:5000";

class ApiModule {
  static AuthClient? _authClient;

  static AuthClient auth() =>
      _authClient ??
      AuthClient(
        Dio(),
        baseUrl: baseUrl,
      );
  // static ApiClient api() =>
  //     _apiClient ??
  //     ApiClient(
  //       _addIntercepters(Dio()),
  //       baseUrl: baseUrl,
  //     );
}
