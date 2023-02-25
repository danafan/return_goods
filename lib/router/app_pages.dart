import 'package:return_goods/pages/Index/Index_view.dart';
import 'package:return_goods/pages/home/home.binding.dart';
import 'package:return_goods/pages/home/home_view.dart';
import 'package:return_goods/pages/package/package_binding.dart';
import 'package:return_goods/pages/package/package_view.dart';
import 'package:return_goods/pages/login/login_binding.dart';
import 'package:return_goods/pages/login/login_view.dart';
import 'package:return_goods/pages/notfound/notfound_view.dart';
import 'package:return_goods/pages/proxy/proxy_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Index;

  static final routes = [
    GetPage(
      name: AppRoutes.Index,
      page: () => IndexPage()
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.Home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.Package,
      page: () => PackagePage(),
      binding: PackageBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundPage(),
  );

  static final proxyRoute = GetPage(
    name: AppRoutes.Proxy,
    page: () => ProxyPage(),
  );
}
