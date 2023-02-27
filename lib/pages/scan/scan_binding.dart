import 'package:return_goods/pages/scan/scan_controller.dart';
import 'package:get/get.dart';

class ScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrScanController>(() => QrScanController());
  }
}
