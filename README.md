# update_manager_ohos

[![pub package](https://img.shields.io/pub/v/update_manager_ohos.svg)](https://pub.dartlang.org/packages/update_manager_ohos) [![GitHub stars](https://img.shields.io/github/stars/harmonycandies/update_manager_ohos)](https://github.com/harmonycandies/update_manager_ohos/stargazers) [![GitHub forks](https://img.shields.io/github/forks/harmonycandies/update_manager_ohos)](https://github.com/harmonycandies/update_manager_ohos/network) [![GitHub license](https://img.shields.io/github/license/harmonycandies/update_manager_ohos)](https://github.com/harmonycandies/update_manager_ohos/blob/master/LICENSE) [![GitHub issues](https://img.shields.io/github/issues/harmonycandies/update_manager_ohos)](https://github.com/harmonycandies/update_manager_ohos/issues) ![HarmonyCandies QQ 群](https://img.shields.io/badge/dynamic/yaml?url=https%3A%2F%2Fraw.githubusercontent.com%2Fharmonycandies%2F.github%2Frefs%2Fheads%2Fmain%2Fdata.yml&query=%24.qq_group_number&label=QQ%E7%BE%A4&logo=qq&color=1DACE8)


Provide version check and upgrade functionality for Flutter on HarmonyOS.

提供 Flutter HarmonyOS 平台上的版本检查和升级功能

## 安装 / Installation

```yaml
dependencies:
  update_manager_ohos: ^0.0.1
```

## 使用 / Usage

```dart
final hasUpdate = await UpdateManagerOhos.instance.checkUpdate();
debugPrint('hasUpdate: $hasUpdate');

/// 如果有可用的更新，弹出升级弹窗
if (hasUpdate) {
  final didShowDialog = await UpdateManagerOhos.instance.showUpdateDialog();
  debugPrint('didShowDialog: $didShowDialog');
}
```

### 官方文档

More information can be found in the official [updateManager][1]

详情请参考官方 API 文档: [updateManager][1]

 [1]: https://developer.huawei.com/consumer/cn/doc/harmonyos-references-V5/store-updatemanager-V5
