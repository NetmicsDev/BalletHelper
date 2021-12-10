import 'dart:developer';

import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';

import 'login_provider.dart';

class NoticeProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://$host:$port';
    httpClient.defaultContentType = 'application/json; charset=UTF-8';

    httpClient.addRequestModifier<Object?>((request) {
      request.headers['uid'] = GetStorage().read('login')['uid'];
      return request;
    });
  }

  Future<Response> getNoticeAll() => get('/post/notices');
  Future<Response> getNoticeList(int branchId) =>
      get('/post/notices/$branchId');
  Future<Response> getNotice(int branchId, int classId) =>
      get('/post/notices/$branchId/$classId');
  Future<Response> addNotice(
          int branchId, int classId, Map<String, dynamic> data) =>
      post('/post/notices/$branchId/$classId', data);
  Future<Response> updateNotice(
          int branchId, int classId, Map<String, dynamic> data) =>
      put('/post/notices/$branchId/$classId', data);
}
