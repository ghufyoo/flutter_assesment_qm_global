import 'package:flutter/material.dart';
import 'package:flutter_starter_template/core/theme/themes.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
     theme: Themes.light,
    ),
  );
}
