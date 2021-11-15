import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SampleItemDetailsView extends StatelessWidget {
  const SampleItemDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details ${Get.parameters['id']}'),
      ),
      body: Center(
        child: Text(Get.arguments),
      ),
    );
  }
}
