import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/data/models/stocks_model.dart';
// import 'package:getx_stocks_pse/app/data/providers/stock_provider.dart';
import 'package:getx_stocks_pse/app/data/services/stocks_service.dart';
import 'dart:convert';

class StocksController extends GetxController {
  //TODO: Implement StocksController

  // final count = 0.obs;
  List<Stocks> stockList = <Stocks>[].obs;
  var isLoading = true.obs;
  final StocksService _stocksService = StocksService();

  @override
  void onInit() {
    // fetchStocks();
    _getAllProducts();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  // void increment() => count.value++;

  void _getAllProducts() async {
    var stocks = await _stocksService.getStocks();
    var result = json.decode(stocks.body);

    result.forEach((data) {
      stockList.add(Stocks.fromJson(data));
    });
    // this.isLoading = false;
    isLoading(false);

    // isLoading = false;
  }
}
