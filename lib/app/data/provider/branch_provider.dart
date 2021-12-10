import 'dart:developer';

import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';

import 'login_provider.dart';

class BranchProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://$host:$port';
    httpClient.defaultContentType = 'application/json; charset=UTF-8';

    httpClient.addRequestModifier<Object?>((request) {
      request.headers['uid'] = GetStorage().read('login')['uid'];
      return request;
    });
  }

  Future<Response> getBranchList() => get('/academy/branch');
  Future<Response> getBranch(int id) => get('/academy/branch/$id');
  Future<Response> addBranch(Map<String, dynamic> data) =>
      post('/academy/branch', data);
  Future<Response> updateBranch(int id, Map<String, dynamic> data) =>
      put('/academy/branch/$id', data);
}
