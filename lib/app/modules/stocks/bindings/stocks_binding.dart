import 'package:get/get.dart';

import '../controllers/stocks_controller.dart';

class StocksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StocksController>(
      () => StocksController(),
    );
  }
}
