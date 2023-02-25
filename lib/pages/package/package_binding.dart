import 'package:return_goods/pages/package/package_controller.dart';
import 'package:get/get.dart';

class PackageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PackageController>(() => PackageController());
  }
}
