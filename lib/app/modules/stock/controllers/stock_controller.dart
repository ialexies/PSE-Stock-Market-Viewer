import 'dart:convert';

import 'package:get/get.dart';
import 'package:ph_stocks_viewer/app/data/models/stock_model.dart';
import 'package:ph_stocks_viewer/app/data/services/stock_service.dart';

class StockController extends GetxController {
  //TODO: Implement StockController

  // List<Stock> stockList = <Stock>[].obs;
  final StockService _stocksService = StockService();
  // Stock stock = Stock().obs;
  // final String _tickerSymbol;
  // var _tickerSymbol = Get.arguments['tickerSymbol'];

  // StockController(this._tickerSymbol);

  final count = 0.obs;
  @override
  void onInit() {
    getStockInfo(Get.arguments['tickerSymbol']);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  Future<Stock> getStockInfo(tickerSymbol) async {
    var stock = await _stocksService.getStock(tickerSymbol);
    var result = await json.decode(stock.body);

    // result["stocks"].forEach((data) async {
    stock = await Stock.fromJson(result);
    // stock = result;
    // print(stock);
    // });

    return await stock;
    // result
  }
}
