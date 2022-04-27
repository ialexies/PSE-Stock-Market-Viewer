import 'package:get/get.dart';

import 'package:getx_stocks_pse/app/modules/home/bindings/home_binding.dart';
import 'package:getx_stocks_pse/app/modules/home/views/home_view.dart';
import 'package:getx_stocks_pse/app/modules/stock/bindings/stock_binding.dart';
import 'package:getx_stocks_pse/app/modules/stock/views/stock_view.dart';
import 'package:getx_stocks_pse/app/modules/stocks/bindings/stocks_binding.dart';
import 'package:getx_stocks_pse/app/modules/stocks/views/stocks_view.dart';

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
      name: _Paths.STOCKS, //'/stocks'
      page: () => StocksView(),
      binding: StocksBinding(),
    ),
    GetPage(
      name: _Paths.CRYPTO,
      page: () => CryptoView(),
      binding: StockBinding(),
    ),
  ];
}
