import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => ScreenUtilInit(
          designSize: Size(1080, 2460),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_) {
            return GetMaterialApp(
              title: "Application",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
              debugShowCheckedModeBanner: false,
            );
          }),
    ),
  );
}
