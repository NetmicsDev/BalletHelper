import 'dart:developer';

import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';

import 'login_provider.dart';

class StudentProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://$host:$port';
    httpClient.defaultContentType = 'application/json; charset=UTF-8';

    httpClient.addRequestModifier<Object?>((request) {
      request.headers['uid'] = GetStorage().read('login')['uid'];
      return request;
    });
  }

  Future<Response> getStudentList() => get('/student/students');
  Future<Response> getStudent(int id) => get('/student/students/$id');
  Future<Response> addStudent(Map<String, dynamic> data) =>
      post('/student/students', data);
  Future<Response> updateStudent(int id, Map<String, dynamic> data) =>
      put('/student/students/$id', data);
}
