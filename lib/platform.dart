import 'package:flutter/services.dart';

class PlatformInfo {
  final MethodChannel platformInfo;

  const PlatformInfo({
    this.platformInfo: const MethodChannel('sample.flutter/platform'),
  });

  Future<String> platform() async {
    String platform;
    try {
      platform = await platformInfo.invokeMethod('platformName');
    } catch (e) {
      return "Error: $e";
    }
    if (platform.isEmpty) {
      return "Error, empty string";
    }
    return platform;
  }
}
