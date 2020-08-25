import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class INSUtils {
  static Future<String> getDeviceId(context, {Function onDone}) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String r = "";
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      r = iosDeviceInfo.identifierForVendor;
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      r = androidDeviceInfo.androidId;
    }
    if (onDone != null) {
      onDone(r);
    }
    return r;
  }
}
