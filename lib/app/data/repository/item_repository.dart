import 'dart:developer';

import 'package:ballet_helper/app/data/model/sample_item.dart';
import 'package:ballet_helper/app/data/provider/pref.dart';
import 'package:get_storage/get_storage.dart';

class ItemRepository {
  final Pref pref = Pref(GetStorage('item'));

  getItems() async {
    log('getItems from ItemRepository: ${(await pref.getAll()).toString()}');
    return (await pref.getAll()).map<SampleItem>((e) => SampleItem(e)).toList();
  }

  SampleItem getItem(int id) => SampleItem(pref.get(key: id.toString()));

  setItem(SampleItem item) => pref.set(key: item.id.toString(), value: item.id);

  removeItem(SampleItem item) => pref.remove(key: item.id.toString());
}
