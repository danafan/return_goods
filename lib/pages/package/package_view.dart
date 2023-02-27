import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:return_goods/components/components.dart';
import 'package:return_goods/pages/package/package_controller.dart';
import 'package:return_goods/common/colors/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:return_goods/router/app_pages.dart';

class PackagePage extends GetView<PackageController> {
  PackagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PackageController _packageController = Get.put(PackageController());
    return BaseScaffold(
      appBar: MyAppBar(
        centerTitle: true,
        title: MyTitle('打包'),
        leadingType: AppBarBackType.Back,
      ),
      body: Column(
        children: [
          //顶部输入框和扫码按钮
          _topScan(_packageController.codeController),
          SizedBox(height: 6.h),
          Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 20.w),
                      color: AppColors.primaryWhite,
                      child: Text(
                        '商品列表',
                        style: TextStyle(
                            color: AppColors.primaryText,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: ListView.builder(
                            itemCount: _packageController.orderList.length + 1,
                            itemBuilder: (context, index) {
                              if (index < _packageController.orderList.length) {
                                return _goodsItem();
                              } else {
                                return _listBottom();
                              }
                            }))
                  ],
                ),
              )),
          SizedBox(height: 6.h),
          //底部
          _bottomBox()
        ],
      ),
    );
  }
}

//顶部输入框和扫码按钮
_topScan(codeController) {
  return Container(
      color: AppColors.primaryWhite,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                height: 30.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 22.w,
                ),
                decoration: BoxDecoration(
                    color: AppColors.primaryShallowDark,
                    borderRadius: BorderRadius.circular(15.h)),
                constraints: BoxConstraints(minHeight: 30.h, maxHeight: 30.h),
                child: TextField(
                  autofocus: true,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (value) {
                    print(codeController.text);
                  },
                  controller: codeController,
                  style:
                      TextStyle(color: AppColors.primaryText, fontSize: 12.sp),
                  cursorColor: AppColors.primaryDark,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.primaryShallowDark, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.primaryShallowDark, width: 1)),
                      hintText: '请输入唯一码',
                      hintStyle: TextStyle(fontSize: 12.sp),
                      contentPadding: EdgeInsets.fromLTRB(0, 5.h, 0, 0)),
                ),
              )),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.Scan),
            child: Image(
              image: AssetImage('images/scan_icon.png'),
              width: 20.w,
              height: 20.h,
            ),
          ),
        ],
      ));
}

//某一个商品
_goodsItem() {
  return Container(
    color: AppColors.primaryWhite,
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '这是商品',
          style: TextStyle(fontSize: 14.sp, color: AppColors.primaryText),
        ),
        Row(
          children: [
            Text('6',
                style:
                    TextStyle(fontSize: 14.sp, color: AppColors.primaryDark)),
            SizedBox(width: 2.w),
            Container(
              width: 5.w,
              height: 5.w,
              decoration: BoxDecoration(
                  color: Color(0xFFFF0000),
                  borderRadius: BorderRadius.circular(2.5.w)),
            )
          ],
        )
      ],
    ),
  );
}

//列表底部组件
_listBottom() {
  return Container(
    alignment: Alignment.center,
    child: Text(
      '到底了~',
      style: TextStyle(color: AppColors.primaryDark, fontSize: 12.sp),
    ),
  );
}

//底部
_bottomBox() {
  return Container(
    color: AppColors.primaryWhite,
    height: 53.h,
    padding: EdgeInsets.only(left: 20.w, right: 10.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '共6件商品',
          style: TextStyle(fontSize: 14.sp, color: AppColors.primaryBlack),
        ),
        Row(
          children: [
            Container(
              width: 94.w,
              height: 32.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(16.h)),
              child: Text(
                '重置',
                style:
                    TextStyle(fontSize: 14.sp, color: AppColors.primaryColor),
              ),
            ),
            SizedBox(width: 8.w),
            GestureDetector(
                onTap: () => {
                      Get.defaultDialog(
                          title: '确认包裹信息',
                          titleStyle: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryText),
                          actions:<Widget>[
                            Text('data')
                          ],
                          content: Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('供应商：请选择'),
                                SizedBox(height: 8.h),
                                Text('仓库：请选择'),
                                SizedBox(height: 8.h),
                                Text('包裹号码：请选择',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.primaryText)),
                                SizedBox(height: 8.h),
                                Text('商品件数：请选择',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.primaryText)),
                                SizedBox(height: 8.h),
                                Text('打包日期：请选择',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.primaryText)),
                                SizedBox(height: 8.h),
                                Text('打包人：请选择',
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.primaryText)),
                                SizedBox(height: 8.h),
                                Text('备注：请选择'),
                                SizedBox(height: 15.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 110.w,
                                      height: 30.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.h),
                                        color: AppColors.primaryColor
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '确认打包',
                                        style: TextStyle(
                                            color: AppColors.primaryWhite,
                                            fontSize: 14.sp),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ))
                    },
                child: Container(
                  width: 94.w,
                  height: 32.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(16.h)),
                  child: Text(
                    '完成打包',
                    style: TextStyle(
                        fontSize: 14.sp, color: AppColors.primaryWhite),
                  ),
                )),
          ],
        )
      ],
    ),
  );
}
