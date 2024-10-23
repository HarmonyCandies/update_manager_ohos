import 'package:flutter/services.dart';

const _kMessageChannel = "com.fluttercandies/update_manager_ohos";

class UpdateManagerOhos {
  UpdateManagerOhos._();

  static final UpdateManagerOhos _instance = UpdateManagerOhos._();

  static UpdateManagerOhos get instance => _instance;

  final _channel = const MethodChannel(_kMessageChannel);

  /// 检查是否有可用的更新。
  ///
  /// 如果有可用的更新，返回 `true`，否则返回 `false`
  ///
  /// 如果有可用的更新，后续可调用 [showUpdateDialog] 方法弹出升级弹窗
  Future<bool> checkUpdate() async {
    final result = await _channel.invokeMethod<bool>('checkUpdate');
    return result ?? false;
  }

  /// 显示升级弹窗，点击升级将跳转
  ///
  /// 成功返回 `true`，失败返回 `false`
  Future<bool> showUpdateDialog() async {
    final result = await _channel.invokeMethod<bool>('showUpdateDialog');
    return result ?? false;
  }
}
