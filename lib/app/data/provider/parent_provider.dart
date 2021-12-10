import 'dart:developer';

import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';

import 'login_provider.dart';

class ParentProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://$host:$port';
    httpClient.defaultContentType = 'application/json; charset=UTF-8';

    httpClient.addRequestModifier<Object?>((request) {
      request.headers['uid'] = GetStorage().read('login')['uid'];
      return request;
    });
  }

  Future<Response> getParentList() => get('/student/parents');
  Future<Response> getParent(int id) => get('/student/parents/$id');
  Future<Response> addParent(Map<String, dynamic> data) =>
      post('/student/parents', data);
  Future<Response> updateParent(int id, Map<String, dynamic> data) =>
      put('/student/parents/$id', data);
}
