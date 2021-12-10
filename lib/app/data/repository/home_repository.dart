import 'dart:developer';

import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/data/provider/home_provider.dart';
import 'package:ballet_helper/app/data/provider/login_provider.dart';
import 'package:get_storage/get_storage.dart';

class HomeRepository {
  final HomeProvider _api;

  HomeRepository(this._api);

  Future<Map<String, dynamic>> getTeachers() async {
    final response = await _api.getTeachersData();
    log(response.body.toString());
    return {};
  }
}
