import 'dart:convert';

import 'package:get/get.dart';
// import 'package:getx_stocks_pse/app/data/models/sales_data.dart';
import 'package:getx_stocks_pse/app/data/models/stock_history.dart';
import 'package:getx_stocks_pse/app/data/models/stock_model.dart';
import 'package:getx_stocks_pse/app/data/models/stocks_model.dart';
import 'package:getx_stocks_pse/app/data/services/stock_history_service.dart';
import 'package:getx_stocks_pse/app/data/services/stock_service.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StockController extends GetxController {
  //TODO: Implement StockController

  final StockService _stockService = StockService();
  var stockInfo = Stocks().obs;
  var stockHistory =
      StockHistory(market_caps: [], total_volumes: [], prices: []).obs;
  final StockHistoryService _stockHistoryService = StockHistoryService();

  Rx<ZoomPanBehavior> zoomPanBehavior = ZoomPanBehavior().obs;
  final count = 0.obs;
  @override
  void onInit() {
    // print('fdfdf');
    // getStockInfo(Get.arguments);
    stockInfo.value = Get.arguments;

    zoomPanBehavior.value = ZoomPanBehavior(
        // Enables pinch zooming
        enablePinching: true);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getStockInfo(stockData) async {
    var stock = await _stockService.getStock(stockData);
    var result = await json.decode(stock.body);
    stock = await Stock.fromJson(result);
    this.stockInfo.value = await stock;

    stockHistory.value = await _stockService.getStockHistory(stockData);

    Map<String, dynamic> stockInfo =
        await {"stock": stock, "stockHistory": stockHistory};
    return stock;
  }
}
