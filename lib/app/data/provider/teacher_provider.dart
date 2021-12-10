import 'dart:developer';

import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';

import 'login_provider.dart';

class TeacherProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://$host:$port';
    httpClient.defaultContentType = 'application/json; charset=UTF-8';

    httpClient.addRequestModifier<Object?>((request) {
      request.headers['uid'] = GetStorage().read('login')['uid'];
      return request;
    });
  }

  Future<Response> getTeacherList() => get('/academy/teachers');
  Future<Response> getTeacher(int id) => get('/academy/teachers/$id');
  Future<Response> addTeacher(Map<String, dynamic> data) =>
      post('/academy/teachers', data);
  Future<Response> updateTeacher(int id, Map<String, dynamic> data) =>
      put('/academy/teachers/$id', data);
}
