import 'dart:developer';

import 'package:ballet_helper/app/data/model/sample_item.dart';
import 'package:ballet_helper/app/data/provider/pref.dart';
import 'package:ballet_helper/app/data/repository/item_repository.dart';
import 'package:get/get.dart';

class ItemController extends GetxController {
  final ItemRepository repository = ItemRepository();
  late RxList<SampleItem> itemList = <SampleItem>[].obs;

  @override
  onInit() {
    getAll();
    super.onInit();
  }

  getAll() async {
    log('getAll from ItemController');
    itemList.addAll(await repository.getItems());
  }

  add(SampleItem item) async {
    await repository.setItem(item);
    itemList.add(item);
    log('getAll from ItemController ${repository.getItems()}');
  }

  remove(SampleItem item) async {
    await repository.removeItem(item);
    itemList.remove(item);
  }
}
