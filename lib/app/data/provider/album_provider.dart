import 'dart:developer';

import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';

import 'login_provider.dart';

class AlbumProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://$host:$port';
    httpClient.defaultContentType = 'application/json; charset=UTF-8';

    httpClient.addRequestModifier<Object?>((request) {
      request.headers['uid'] = GetStorage().read('login')['uid'];
      return request;
    });
  }

  Future<Response> getAlbumAll() => get('/post/albums');
  Future<Response> getAlbumList(int branchId) => get('/post/albums/$branchId');
  Future<Response> getAlbum(int branchId, int classId) =>
      get('/post/albums/$branchId/$classId');
  Future<Response> addAlbum(
          int branchId, int classId, Map<String, dynamic> data) =>
      post('/post/albums/$branchId/$classId', data);
  Future<Response> updateAlbum(
          int branchId, int classId, Map<String, dynamic> data) =>
      put('/post/albums/$branchId/$classId', data);
}
