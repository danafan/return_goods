import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:return_goods/components/components.dart';
import 'package:return_goods/pages/scan/scan_controller.dart';
import 'package:return_goods/common/colors/colors.dart';
import 'package:get/get.dart';
// import 'package:scan/scan.dart';

class ScanPage extends GetView<QrScanController> {
  ScanPage({Key? key}) : super(key: key);

  // ScanController _scanController = ScanController();

  @override
  Widget build(BuildContext context) {
    QrScanController _qrScanController = Get.put(QrScanController());
    return BaseScaffold(
        appBar: MyAppBar(
          centerTitle: true,
          title: MyTitle('扫码'),
          leadingType: AppBarBackType.Back,
        ),
        body: Container(
          child: Text('扫描二维码'),
        )
    );
  }
}

