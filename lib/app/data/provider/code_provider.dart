import 'package:get/get_connect.dart';

import 'login_provider.dart';

class CodeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://$host:$port';
    httpClient.defaultContentType = 'application/json; charset=UTF-8';
  }

  Future<Response> createCode(Map<String, dynamic> data) =>
      post('/academy/code', data);

  Future<Response> confirmCode(String code) => get('/academy/code/$code');
}
