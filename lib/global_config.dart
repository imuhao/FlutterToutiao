import 'package:flutter/material.dart';

class GlobalConfig {
  static Color color = Colors.red;
  static ThemeData theme = ThemeData(primaryColor: color);
  static String BASE_URL = "120.55.14.103:9090";

  static var nowTime = new DateTime.now().millisecondsSinceEpoch;

  static String KIND_URL =
      "/api/kind/myKinds.json";
}
