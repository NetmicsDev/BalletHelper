import 'package:ballet_helper/app/controller/main_controller.dart';
import 'package:ballet_helper/app/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends GetView<MainController> {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
      ),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: Drawer(
        child: Center(
          child: Text('MENU'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [],
      ),
    );
  }
}
