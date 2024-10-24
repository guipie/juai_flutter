import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:juai_flutter/app/data/services/app.dart';
import 'package:juai_flutter/app/global_widgets/dialogs/common_alert.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static PermissionUtil? _instance;

  PermissionUtil._internal() {
    _instance = this;
  }

  ///工厂构造函数
  factory PermissionUtil() => _instance ??= PermissionUtil._internal();

  /// 申请定位权限
  Future<bool> requestLocation() async {
    bool hasPermission = await requestPermissions(
      [
        Permission.location,
        Permission.locationWhenInUse,
      ],
      message: "您已拒绝定位权限，是否前往设置打开？",
    );
    return hasPermission;
  }

  Future<bool> requestFirstLocation() async {
    final status = await Permission.location.request();
    return status.isGranted;
  }

  /// 申请存储权限
  Future<bool> requestStorage() async {
    bool hasPermission = await requestPermissions(
      [Permission.storage],
      message: "您已拒绝存储权限，是否前往设置打开？",
    );
    return hasPermission;
  }

  /// 申请相机、相册权限
  Future<bool> requestCameraAndPhoto() async {
    bool hasPermission = await requestPermissions(
      [Permission.camera, Permission.storage, Permission.photos],
      message: '您已拒绝相机/相册权限，是否前往设置打开？',
    );
    return hasPermission;
  }

  /// 相册权限
  Future<bool> requestPhoto() async {
    var permissions = [Permission.storage, Permission.photos];
    if (GetPlatform.isAndroid) {
      final version = double.tryParse(AppService.to.device.systemVersion) ?? 0;
      if (version <= 32) {
        permissions = [Permission.storage];
      } else {
        permissions = [Permission.photos];
      }
    }

    bool hasPermission = await requestPermissions(
      permissions,
      message: '您已拒绝相册权限，是否前往设置打开？',
      bothGranted: false,
    );
    return hasPermission;
  }

  /// 申请相机
  Future<bool> requestCamera() async {
    bool hasPermission = await requestPermissions(
      [Permission.camera, Permission.storage],
      message: '您已拒绝相机权限，是否前往设置打开？',
    );
    return hasPermission;
  }

  /// 申请存储权限
  Future<bool> requestContacts() async {
    bool hasPermission = await requestPermissions(
      [Permission.contacts],
      message: "您已拒绝通讯录权限，是否前往设置打开？",
    );
    return hasPermission;
  }

  /// 组合权限判断是否通过
  Future<PermissionStatus> _request(
    List<Permission> items, {
    /// 是否多个权限都通过
    bool bothGranted = true,
  }) async {
    Map<Permission, PermissionStatus> res = await items.request();
    PermissionStatus status = PermissionStatus.granted;

    res.forEach((key, value) {
      if (!bothGranted && value.isGranted) {
        status = value;
        return;
      } else if (!value.isGranted) {
        status = value;
        return;
      }
    });
    return status;
  }

  //通用单个权限请求
  // Future<bool> requestPermission(Permission permission,
  //     {String message = '您已拒绝使用权限，前往设置打开'}) async {
  //   final status = await permission.status;

  //   if (status.isDenied) {
  //     return status.isGranted;
  //   } else if (status.isPermanentlyDenied || status.isRestricted) {
  //     openAppSettings();
  //   }
  //   return false;
  //   // return _request(permission, message);
  // }

  //通用多个权限请求
  Future<bool> requestPermissions(
    List<Permission> permissions, {
    String message = '您已拒绝使用权限，请前往设置打开',

    /// 是否多个权限都通过
    bool bothGranted = true,
  }) async {
    bool isGranted = true;
    for (var permission in permissions) {
      final status = await permission.status;
      if (!bothGranted && status.isGranted) {
        isGranted = true;
      } else if (!status.isGranted) {
        isGranted = false;
        break;
      }
    }
    if (isGranted) return isGranted;

    // 发起权限请求
    final saveKey = permissions.map((e) => e.value).join(',');
    final status = await _request(permissions, bothGranted: bothGranted);

    // 判断是否第一次请求权限
    final box = GetStorage();
    // 第一次拒绝，不显示打开设置提示
    final firstReqeust = box.read(saveKey) == null;

    // 记录权限请求缓存
    if (firstReqeust) {
      box.write(saveKey, saveKey);
      return status.isGranted;
    }

    // 如果是通过或者第一次请求，返回请求结果
    if (status.isGranted) {
      return status.isGranted;
    }

    // 第N请求权限，默认打开消息提示框
    Get.dialog(
      AlertContentView(
        title: "提示",
        content: message,
        onRight: () async {
          await openAppSettings();
        },
      ),
      useSafeArea: false,
      barrierColor: const Color(0x43010101),
    );

    return status.isGranted;
  }

  //通用获取权限状态
  Future<bool> requestStatus(Permission permission) async {
    final status = await permission.status;
    return status.isGranted;
  }
}
