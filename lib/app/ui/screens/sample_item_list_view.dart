import 'dart:developer';

import 'package:ballet_helper/app/controller/item_controller.dart';
import 'package:ballet_helper/app/data/model/sample_item.dart';
import 'package:ballet_helper/app/data/provider/pref.dart';
import 'package:ballet_helper/app/data/repository/item_repository.dart';
import 'package:ballet_helper/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class SampleItemListView extends StatelessWidget {
  SampleItemListView({Key? key}) : super(key: key);

  ItemController controller = Get.put(ItemController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        log('GetX Called ${controller.itemList}');
        return Scaffold(
          appBar: AppBar(
            title: const Text('Sample Items'),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Get.toNamed(Routes.setting);
                },
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.add(SampleItem(controller.itemList.length + 1));
            },
          ),
          body: controller.itemList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                        height: 1,
                      ),
                  itemCount: controller.itemList.length,
                  itemBuilder: (context, index) {
                    final item = controller.itemList[index];
                    return ListTile(
                        title: Text('SampleItem ${item.id}'),
                        leading: const CircleAvatar(
                          foregroundImage:
                              AssetImage('assets/images/flutter_logo.png'),
                        ),
                        onTap: () {
                          Get.toNamed(Routes.getDetail(id: item.id),
                              arguments: 'This is argument for ${item.id}');
                        });
                  }),
        );
      },
    );
  }
}
