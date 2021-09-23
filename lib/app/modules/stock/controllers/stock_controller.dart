import 'dart:convert';

import 'package:get/get.dart';
// import 'package:getx_stocks_pse/app/data/models/sales_data.dart';
import 'package:getx_stocks_pse/app/data/models/stock_history.dart';
import 'package:getx_stocks_pse/app/data/models/stock_model.dart';
import 'package:getx_stocks_pse/app/data/services/stock_history_service.dart';
import 'package:getx_stocks_pse/app/data/services/stock_service.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StockController extends GetxController {
  //TODO: Implement StockController

  final StockService _stocksService = StockService();
  List<StockHistory> stockHistoryList = <StockHistory>[].obs;
  final StockHistoryService _stockHistoryService = StockHistoryService();

  Rx<ZoomPanBehavior> zoomPanBehavior = ZoomPanBehavior().obs;
  final count = 0.obs;
  @override
  void onInit() {
    getStockInfo(Get.arguments['tickerSymbol']);

    zoomPanBehavior.value = ZoomPanBehavior(
        // Enables pinch zooming
        enablePinching: true);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<Stock> getStockInfo(tickerSymbol) async {
    var stock = await _stocksService.getStock(tickerSymbol);
    var result = await json.decode(stock.body);

    // result["stocks"].forEach((data) async {
    stock = await Stock.fromJson(result);
    List<StockHistory>? stockHistory = await getStockHistory(tickerSymbol);
    var stockInfo = await {"stock": stock, "stockHistory": stockHistory};
    // stock = result;
    // print(stock);
    // });
    // getStockHistory(Get.arguments['tickerSymbol']);
    // stockHistoryList = await getStockHistory(tickerSymbol);
    // return await stock;
    return await stock;
    // result
  }

  getStockHistory(tickerSymbol) async {
    var stockHistory =
        await _stockHistoryService.getStockHistoryAll(tickerSymbol);
    var result = json.decode(stockHistory.body);
    result["history"].forEach((data) {
      stockHistoryList.add(StockHistory.fromJson(data));
    });
    // print('fdf');
  }
}
