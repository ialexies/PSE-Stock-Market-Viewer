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
  //TODO: Implement StocksController

  // final count = 0.obs;
  List<Stocks> stockList = <Stocks>[].obs;
  List<Stocks> stockListFiltered = <Stocks>[].obs;
  var isLoading = true.obs;
  var searchType = "Company Name".obs;

  final StocksService _stocksService = StocksService();

  @override
  void onInit() {
    // fetchStocks();
    _getAllProducts();
    super.onInit();
  }

  void _getCurrentDate() async {}

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void _getAllProducts() async {
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
        .where((stock) => stock.companyName!
            .toLowerCase()
            .contains(q.toString().toLowerCase()))
        .toList();

    // filteredResult =

    // stockListFiltered.clear();
    stockListFiltered = filteredResult;
    // stockList = stockListFiltered;
    update();
    Get.back();
  }
}
