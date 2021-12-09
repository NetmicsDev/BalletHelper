import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;

const host = '59.13.123.48';
const port = 5001;

class LoginProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://$host:$port';
    httpClient.defaultContentType = 'application/json; charset=UTF-8';
  }

  Future<Response> signInTeacher(Map<String, dynamic> data) =>
      post('/academy/login', data);

  // Get request
  // Future<Response> getUser(int id) => get('http://youapi/users/id');

  // Post request
  // Future<Response> postUser(Map data) => post('http://youapi/users', data);

  // Post request with File
  // Future<Response<CasesModel>> postCases(List<int> image) {
  //   final form = FormData({
  //     'file': MultipartFile(image, filename: 'avatar.png'),
  //     'otherFile': MultipartFile(image, filename: 'cover.png'),
  //   });
  //   return post('http://youapi/users/upload', form);
  // }

  // GetSocket userMessages() {
  //   return socket('https://yourapi/users/socket');
  // }

}
