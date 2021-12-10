import 'dart:developer';

import 'package:ballet_helper/app/controller/login_controller.dart';
import 'package:ballet_helper/app/data/model/branch_model.dart';
import 'package:ballet_helper/app/data/provider/branch_provider.dart';
import 'package:ballet_helper/app/data/provider/home_provider.dart';
import 'package:ballet_helper/app/data/provider/login_provider.dart';
import 'package:get_storage/get_storage.dart';

class AcademyRepository {
  final BranchProvider _api;

  AcademyRepository(this._api);

  Future<List<BranchModel>> getBranchList() async {
    final response = await _api.getBranchList();
    log(response.body.toString());
    return response.body.map((e) => BranchModel.fromMap(e)).toList();
  }
}
