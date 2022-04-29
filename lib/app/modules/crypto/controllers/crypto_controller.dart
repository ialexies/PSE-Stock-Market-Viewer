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

import 'package:getx_stocks_pse/app/modules/cryptos/controllers/cryptos_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CryptoController extends GetxController {
  final CryptoService _cryptoService = CryptoService();
  List<CryptoHistory> stockHistoryList = <CryptoHistory>[].obs;
  final CryptoHistoryService _stockHistoryService = CryptoHistoryService();

  final CryptosController cryptosController = Get.put(CryptosController());

  Rx<ZoomPanBehavior> zoomPanBehavior = ZoomPanBehavior().obs;
  final count = 0.obs;
  @override
  void onInit() {
    // Crypto fetchCrypto = Crypto.fromJson(Get.parameters);

    // getCryptoInfo(fetchCrypto.name);

    zoomPanBehavior.value = ZoomPanBehavior(
        // Enables pinch zooming
        enablePinching: true);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<Crypto> getCryptoInfo(id) async {
    String api = "coins";
    var response = await _cryptoService.getCrypto(api, id);

    Crypto mappedResponse = Crypto.fromJson(json.decode(response.body),
        cryptosController.currencySelected.value.toString());

    return mappedResponse;
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
