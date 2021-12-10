import 'dart:developer';

import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';

import 'login_provider.dart';

class ClassProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://$host:$port';
    httpClient.defaultContentType = 'application/json; charset=UTF-8';

    httpClient.addRequestModifier<Object?>((request) {
      request.headers['uid'] = GetStorage().read('login')['uid'];
      return request;
    });
  }

  Future<Response> getClassAll() => get('/academy/class');
  Future<Response> getClassList(int branchId) => get('/academy/class$branchId');
  Future<Response> getClass(int branchId, int classId) =>
      get('/academy/class/$branchId/$classId');
  Future<Response> addClass(Map<String, dynamic> data) =>
      post('/academy/class', data);
  Future<Response> updateClass(
          int branchId, int classId, Map<String, dynamic> data) =>
      put('/academy/branch/$branchId/$classId', data);
}
