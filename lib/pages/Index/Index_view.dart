import 'package:flutter/material.dart';
import 'package:return_goods/global.dart';
import 'package:return_goods/pages/Index/Index_controller.dart';
import 'package:return_goods/pages/home/home_view.dart';
import 'package:return_goods/pages/login/login_view.dart';
import 'package:return_goods/pages/splash/spalsh_view.dart';
import 'package:get/get.dart';

class IndexPage extends GetView<IndexController> {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IndexController controller = Get.put(IndexController());
    return Obx(() => Scaffold(
          body: controller.isloadWelcomePage.isTrue
              ? SplashPage()
              : Global.isOfflineLogin
                  ? HomePage()
                  : LoginPage(),
        ));
  }
}
