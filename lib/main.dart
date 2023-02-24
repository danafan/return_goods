import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:return_goods/common/langs/translation_service.dart';
import 'package:return_goods/global.dart';
import 'package:return_goods/pages/Index/Index_view.dart';
import 'package:return_goods/pages/Index/index_binding.dart';
import 'package:return_goods/router/app_pages.dart';
import 'package:get/get.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 667),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: '退货系统',
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            home: IndexPage(),
            initialBinding: IndexBinding(),
            debugShowCheckedModeBanner: false,
            enableLog: true,
            unknownRoute: AppPages.unknownRoute,
            builder: EasyLoading.init(),
            locale: TranslationService.locale,
            fallbackLocale: TranslationService.fallbackLocale,
          );
        });
  }
}
