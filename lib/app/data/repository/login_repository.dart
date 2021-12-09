import 'dart:developer';

import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/data/provider/login_provider.dart';
import 'package:get_storage/get_storage.dart';

class LoginRepository {
  final LoginProvider _api;

  LoginRepository(this._api);

  Future<Map<String, dynamic>> signIn({
    required UserType type,
    required String email,
    required String password,
  }) async {
    if (type == UserType.parent) {
      return {
        'result': false,
        'message': '아직 구현이 안됐습니다',
      };
    } else {
      final response = await _api.signInTeacher({
        'email': email,
        'password': password,
      });
      Map<String, dynamic> result;
      if (response.statusCode == 200) {
        log('Login Response Success: ${response.body}');
        result = response.body;
        result['result'] = true;
      } else {
        log('Login Response Failed: ${response.body}');
        String message = '아이디가 존재하지 않습니다';
        if (response.body is String &&
            (response.body as String).contains('인증 실패')) {
          message = '비밀번호가 일치하지 않습니다';
        }
        result = {
          'result': false,
          'message': message,
        };
      }
      return result;
    }
  }
}
