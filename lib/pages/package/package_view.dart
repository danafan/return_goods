import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:return_goods/components/components.dart';
import 'package:return_goods/pages/package/package_controller.dart';
import 'package:return_goods/common/colors/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PackagePage extends GetView<PackageController> {
  PackagePage({Key? key}) : super(key: key);

  //输入框controller
  final _codeController = new TextEditingController();

  //订单列表
  List<Map> orderList = [{'ww':'ww'}];
  //是否加载
  bool _isLoad = false;
  //所有数据加载完毕
  bool _isOver = false;
  ScrollController _scrollController = new ScrollController();


  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: MyAppBar(
        centerTitle: true,
        title: MyTitle('打包'),
        leadingType: AppBarBackType.Back,
      ),
      body: Column(
        children: [
          //顶部输入框和扫码按钮
          _topScan(_codeController),
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
                        child: Container(
                          color: AppColors.primaryColor,
                          child: RefreshIndicator(
                            onRefresh: onRefresh,
                            child: ListView.builder(
                                padding: EdgeInsets.all(8),
                                controller: this._scrollController,
                                itemCount: this.orderList.length + 1,
                                itemBuilder: (context, index) {
                                  if (index < this.orderList.length) {
                                    return _goodsItem();
                                  } else {
                                    if (this._isLoad) {
                                      return _loadingMore();
                                    } else {
                                      return _listBottom();
                                    }
                                  }
                                }),
                          ),
                        ))
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

//加载更多数据
  Future loadMoreData() {
    return Future.delayed(Duration(seconds: 3), () {
      print('加载更多');
      // List<Map> newsList = [{'orderStatus':'1'},{'orderStatus':'2'},{'orderStatus':'3'}];
      // setState(() {
      //   this._isLoad = false;
      //   this.orderList.addAll(newsList);
      // });
    });
  }

  //下拉刷新
  Future onRefresh() {
    return Future.delayed(Duration(seconds: 1), () {
      print('当前已是最新数据');
    });
  }


//顶部输入框和扫码按钮
_topScan(_codeController) {
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
                  controller: _codeController,
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
          Image(
            image: AssetImage('images/scan_icon.png'),
            width: 20.w,
            height: 20.h,
          ),
        ],
      ));
}


//某一个商品
_goodsItem(){
  return Container(
    child: Text('这是商品'),
  );
}
//正在加载组件
_loadingMore(){
  return Container(
    child: Text('加载更多'),
  );
}

//列表底部组件
_listBottom(){
  return Container(
    child: Text('底部'),
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
            Container(
              width: 94.w,
              height: 32.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(16.h)),
              child: Text(
                '完成打包',
                style:
                    TextStyle(fontSize: 14.sp, color: AppColors.primaryWhite),
              ),
            )
          ],
        )
      ],
    ),
  );
}
