import 'dart:convert';

import 'package:get/get.dart';
// import 'package:getx_stocks_pse/app/data/models/crypto_mode.dart';
// import 'package:getx_stocks_pse/app/data/models/sales_data.dart';
import 'package:getx_stocks_pse/app/data/models/crypto_history.dart';
// import 'package:getx_stocks_pse/app/data/models/stock_model.dart';
import 'package:getx_stocks_pse/app/data/models/crypto_model.dart';
import 'package:getx_stocks_pse/app/data/services/crypto_history_service.dart';
// import 'package:getx_stocks_pse/app/data/services/stock_history_service.dart';
// import 'package:getx_stocks_pse/app/data/services/stock_history_service.dart';
import 'package:getx_stocks_pse/app/data/services/crypto_service.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CryptoController extends GetxController {
  //TODO: Implement CryptoController

  final CryptoService _stocksService = CryptoService();
  List<CryptoHistory> stockHistoryList = <CryptoHistory>[].obs;
  final CryptoHistoryService _stockHistoryService = CryptoHistoryService();

  Rx<ZoomPanBehavior> zoomPanBehavior = ZoomPanBehavior().obs;
  final count = 0.obs;
  @override
  void onInit() {
    Crypto fetchCrypto = Crypto.fromJson(Get.parameters);

    getCryptoInfo(fetchCrypto.companyName);

    zoomPanBehavior.value = ZoomPanBehavior(
        // Enables pinch zooming
        enablePinching: true);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<Crypto> getCryptoInfo(tickerSymbol) async {
    String api = "coins";
    var stock = await _stocksService.getCrypto(api, tickerSymbol);
    var response = await stock.body;
    // var data = Crypto.fromJson(response);
    // var data = Crypto.fromJson(response.toString());
    // var crypto_data   = Crypto()
    // result["stocks"].forEach((data) async {
    var decoded = json.decode(response);
    var a = await Crypto.fromJson(json.decode(response));
    // List<CryptoHistory>? stockHistory = await getCryptoHistory(tickerSymbol);
    // var stockInfo = await {"stock": stock, "stockHistory": stockHistory};
    // stock = result;
    // print(stock);
    // });
    // getCryptoHistory(Get.arguments['tickerSymbol']);
    // stockHistoryList = await getCryptoHistory(tickerSymbol);
    // return await stock;
    return await stock;
    // result
  }

  getCryptoHistory(tickerSymbol) async {
    var stockHistory =
        await _stockHistoryService.getCryptoHistoryAll(tickerSymbol);
    var result = json.decode(stockHistory.body);
    result["history"].forEach((data) {
      stockHistoryList.add(CryptoHistory.fromJson(data));
    });
    // print('fdf');
  }
}
