import 'package:get/get.dart';

import '../controllers/cryptos_controller.dart';

class CryptosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CryptosController>(
      () => CryptosController(),
    );
  }
}
