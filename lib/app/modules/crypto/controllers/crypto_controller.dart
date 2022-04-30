import 'dart:async';
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
  var isStreamOn = true.obs;
  var isLoading = true.obs;
  var stockStreamController = StreamController<Crypto>().obs;
  var cryptoDetails = Crypto().obs;
  var initDuration = 1.obs;

  @override
  void onInit() async {
    // Crypto fetchCrypto = Crypto.fromJson(Get.parameters);

    stockStreamController.value.addStream(stockStream(Get.arguments));

    zoomPanBehavior.value = ZoomPanBehavior(
        // Enables pinch zooming
        enablePinching: true);

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    StreamController().close();
    initDuration.value = 1;
    super.onClose();
  }

  Stream<Crypto> stockStream(id) async* {
    while (isStreamOn.value == true) {
      await Future.delayed(Duration(milliseconds: initDuration.value));
      try {
        var response = await getCryptoInfo(id);

        cryptoDetails.value = response;
        // print('cryptodetails has info ');

        isLoading.value = false;
        update();
      } catch (e) {
        isLoading.value = false;
        print(e);
        // isLoading.value = true;
      }
      initDuration.value = 10000;
      print('stream count crypto');
      update();
    }
  }

  Future<Crypto> getCryptoInfo(id) async {
    String api = "coins";
    var response = await _cryptoService.getCrypto(api, id);

    Crypto mappedResponse = Crypto.fromJson(
        response.data, cryptosController.currencySelected.value.toString());

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
