import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackageController extends GetxController {

  //输入框controller
  final codeController = new TextEditingController();

  //订单列表
  List<Map> orderList = [
    {'ww': 'ww'},
    {'ww': 'ww'},
    {'ww': 'ww'},
    {'ww': 'ww'},
    {'ww': 'ww'},
    {'ww': 'ww'},
    {'ww': 'ww'},
    {'ww': 'ww'},
    {'ww': 'ww'},
    {'ww': 'ww'},
    {'ww': 'ww'},
    {'ww': 'ww'},
    {'ww': 'ww'},
    {'ww': 'ww'},
    {'ww': 'ww'},
    {'ww': 'ww'},
    {'ww': 'ww'}
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  // void increment() => count.value++;

  // void changeUserName() {
  //   userName = 'juefei';
  //   update();
  // }
}
