import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:return_goods/components/components.dart';
import 'package:return_goods/components/custom_scaffold.dart';
import 'package:return_goods/pages/home/home_controller.dart';
import 'package:return_goods/common/colors/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:return_goods/router/app_pages.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: MyAppBar(
        centerTitle: true,
        title: MyTitle('打包系统'),
        leadingType: AppBarBackType.None,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 12.w, right: 12.w),
        child: Column(
          children: [
            //头部
            _pageTop(),
            SizedBox(height: 14.h),
            //打包
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.Package),
              child: _menuItem('package_icon', '打包'),
            ),
            SizedBox(height: 14.h),
            //批量打包
            _menuItem('all_package', '批量打包'),
          ],
        ),
      ),
    );
  }
}

//头部
_pageTop() {
  return Container(
      height: 60.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '杭州德儿电子商务有限公司（彪子）',
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 137, 255, 0.5),
                borderRadius: BorderRadius.circular(10.h)),
            width: 44.w,
            height: 20.h,
            child: Text('退出',
                style:
                    TextStyle(fontSize: 12.sp, color: AppColors.primaryWhite)),
          ),
        ],
      ));
}

//可点击的菜单
_menuItem(icon, name) {
  return Container(
    height: 78.h,
    padding: EdgeInsets.fromLTRB(10.w, 0, 20.w, 0),
    decoration: BoxDecoration(
        color: AppColors.primaryWhite,
        borderRadius: BorderRadius.circular(8.h),
        boxShadow: [
          BoxShadow(
              color: Color(0XFFF2F7FF),
              offset: Offset(0, 0),
              blurRadius: 8.r,
              spreadRadius: 2.r)
        ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image(
              image: AssetImage('images/${icon}.png'),
              width: 39.w,
              height: 39.h,
            ),
            SizedBox(width: 15.w),
            Text(
              name,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            )
          ],
        ),
        Image(
          image: AssetImage('images/r_arrow.png'),
          width: 10.w,
          height: 18.h,
        ),
      ],
    ),
  );
}
