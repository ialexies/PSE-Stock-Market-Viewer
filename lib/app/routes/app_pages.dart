import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/modules/crypto/bindings/stock_binding.dart';
import 'package:getx_stocks_pse/app/modules/crypto/views/crypto_view.dart';
import 'package:getx_stocks_pse/app/modules/cryptos/bindings/cryptos_binding.dart';
import 'package:getx_stocks_pse/app/modules/cryptos/views/cryptos_view.dart';

import 'package:getx_stocks_pse/app/modules/home/bindings/home_binding.dart';
import 'package:getx_stocks_pse/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.HOME;
  static const INITIAL = Routes.STOCKS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CRYPTOS, //'/stocks'
      page: () => CryptosView(),
      binding: CryptosBinding(),
    ),
    GetPage(
      name: _Paths.CRYPTO,
      page: () => CryptoView(),
      binding: StockBinding(),
    ),
  ];
}
