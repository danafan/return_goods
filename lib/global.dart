import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:return_goods/common/values/values.dart';
import 'package:return_goods/pages/login/login_model.dart';
import 'package:return_goods/utils/local_storage.dart';
import 'package:return_goods/utils/utils.dart';

/// 全局配置
class Global {
  /// 用户配置
  static UserLoginResponseModel? profile = UserLoginResponseModel(token: null);

  /// 是否第一次打开
  static bool isFirstOpen = false;

  /// 是否离线登录
  static bool isOfflineLogin = false;

  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // Ruquest 模块初始化
    Request();
    // 本地存储初始化
    await LoacalStorage.init();

    // 读取设备第一次打开
    isFirstOpen = !LoacalStorage().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      LoacalStorage().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }

    // 读取离线用户信息
    var _profileJSON = LoacalStorage().getJSON(STORAGE_USER_PROFILE_KEY);
    if (_profileJSON != null) {
      profile = UserLoginResponseModel.fromJson(_profileJSON);
      isOfflineLogin = true;
    }

    // android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  // 持久化 用户信息
  static Future<bool> saveProfile(UserLoginResponseModel userResponse) {
    profile = userResponse;
    return LoacalStorage().setJSON(STORAGE_USER_PROFILE_KEY, userResponse.toJson());
  }
}
