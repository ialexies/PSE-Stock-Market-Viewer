import 'dart:convert';

import 'package:get/get.dart';
// import 'package:cryptos/app/data/models/sales_data.dart';
import 'package:cryptos/app/data/models/stock_history.dart';
import 'package:cryptos/app/data/models/stock_model.dart';
import 'package:cryptos/app/data/models/stocks_model.dart';
import 'package:cryptos/app/data/services/stock_history_service.dart';
import 'package:cryptos/app/data/services/stock_service.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StockController extends GetxController {
  //TODO: Implement StockController

  final StockService _stockService = StockService();
  var stockInfo = Stocks().obs;
  var stockInfoMore = Stock().obs;
  var stockHistory =
      StockHistory(market_caps: [], total_volumes: [], prices: []).obs;
  final StockHistoryService _stockHistoryService = StockHistoryService();
  final description = "".obs;

  Rx<ZoomPanBehavior> zoomPanBehavior = ZoomPanBehavior().obs;
  final count = 0.obs;

  @override
  void onInit() async {
    stockInfo.value = Get.arguments;
    stockInfoMore.value = await getStockInfoMore(stockInfo.value);

    zoomPanBehavior.value = ZoomPanBehavior(enablePinching: true);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getStockInfoMore(stockData) async {
    var response = await _stockService.getStock(stockData);
    var result = await json.decode(response.body);
    Stock stockresult = await Stock.fromJson(result);
    stockHistory.value = await _stockService.getStockHistory(stockData);
    
    return stockresult;
  }
}
