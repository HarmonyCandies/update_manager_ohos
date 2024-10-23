import 'package:flutter/material.dart';
import 'dart:async';

import 'package:update_manager_ohos/update_manager_ohos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> checkUpdate() async {
    final hasUpdate = await UpdateManagerOhos.instance.checkUpdate();
    debugPrint('hasUpdate: $hasUpdate');

    /// 如果有可用的更新，弹出升级弹窗
    if (hasUpdate) {
      final didShowDialog = await UpdateManagerOhos.instance.showUpdateDialog();
      debugPrint('didShowDialog: $didShowDialog');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: checkUpdate,
            child: const Text('Check Update'),
          ),
        ),
      ),
    );
  }
}
