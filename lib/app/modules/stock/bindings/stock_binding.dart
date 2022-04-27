import 'package:get/get.dart';

import '../controllers/crypto_controller.dart';

class StockBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CryptoController>(
      () => CryptoController(),
    );
  }
}
