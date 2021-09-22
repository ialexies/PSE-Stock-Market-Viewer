import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.STOCKS);
            },
            child: Text('stocks')),
      ),
    );
  }
}
