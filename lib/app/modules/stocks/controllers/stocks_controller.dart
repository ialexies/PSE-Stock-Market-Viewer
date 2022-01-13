import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/data/models/stocks_model.dart';
// import 'package:getx_stocks_pse/app/data/providers/stock_provider.dart';
import 'package:getx_stocks_pse/app/data/services/stocks_service.dart';
import 'package:getx_stocks_pse/app/modules/stock/controllers/stock_controller.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class StocksController extends GetxController {
  var stockList = <Stocks>[].obs;
  List<Stocks> stockListFiltered = <Stocks>[].obs;
  var stockStreamController = StreamController<Stocks>().obs;
  var isStreamOn = true.obs;
  var stocks = Stocks().obs;
  var isLoading = true.obs;
  var searchType = "Company Name".obs;
  var isSearch = false.obs;
  var searchText = "".obs;
  var currencies = <String>[
    "btc",
    "eth",
    "ltc",
    "usd",
    "aud",
    "eur",
    "gbp",
    "hkd",
    "jpy",
    "php",
    "sgd",
  ].obs;
  var currenciesSymbols = <String>['\$', 'Php'].obs;
  var currencySelected = "USD".obs;
  var currencySelectedSymbol = "\$".obs;

  final StocksService _stocksService = StocksService();

  @override
  void onInit() {
    stockStreamController.value.addStream(stockStream());
    super.onInit();
  }

  void _getCurrentDate() async {}

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  @override
  Stream<Stocks> stockStream() async* {
    while (isStreamOn.value == true) {
      await Future.delayed(Duration(milliseconds: 1000));
      try {
        var response = await _stocksService.getStocks(
            selectedCurrency: currencySelected.value);
        var result = json.decode(response.body);
        List<Stocks> tempStockList = [];

        result.forEach((data) {
          tempStockList.add(Stocks.fromJson(data));
        });
        stockList.value = tempStockList;

        isLoading.value = false;

        if (isSearch.value == true && searchText.value != "") {
          searchFilter(searchText.value);
        } else if (isSearch.value == false && searchText.value == "") {
          stockListFiltered = stockList;
        } else {
          stockListFiltered = stockList;
        }
      } catch (e) {}
    }
  }

  updateSearchStatus(bool val) {

    isSearch.value = val;
    update();
  }

  updateCurrencySelected(String val) {
    val = val.toUpperCase();
    if (val == "USD".toUpperCase()) {
      currencySelectedSymbol.value = "\$";
    } else if (val == "PHP") {
      currencySelectedSymbol.value = "Php";
    } else {
      currencySelectedSymbol.value = val.toUpperCase();
    }
    currencySelected.value = val;
    update();
  }

  void getAllProducts() async {
    var stocks = await _stocksService.getStocks();
    var result = json.decode(stocks.body);

    result.forEach((data) {
      stockList.add(Stocks.fromJson(data));
    });
    isLoading(false);
    stockListFiltered = await stockList;
  }

  void searchFilter(String q) async {
    // _getAllProducts();
    List<Stocks> tempStockAll = await stockList;
    List<Stocks> filteredResult = [];

    filteredResult = tempStockAll
        .where((stock) =>
            stock.name
            .toLowerCase()
            .contains(q.toString().toLowerCase()))
        .toList();

    // filteredResult =

    // stockListFiltered.clear();
    stockListFiltered = filteredResult;
    // isSearch.value = false;
    // stockList = stockListFiltered;
    update();
    // Get.back();
  }
}
