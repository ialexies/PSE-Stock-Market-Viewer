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
  //TODO: Implement StocksController

  // final count = 0.obs;
  var stockList = <Stocks>[].obs;
  List<Stocks> stockListFiltered = <Stocks>[].obs;
  var stockStreamController = StreamController<Stocks>().obs;
  var isStreamOn = true.obs;
  var stocks = Stocks().obs;
  var isLoading = true.obs;
  var searchType = "Company Name".obs;
  var isSearch = false.obs;
  var searchText = "".obs;

  final StocksService _stocksService = StocksService();

  @override
  void onInit() {
    // fetchStocks();
    // _getAllProducts();
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
        var response = await _stocksService.getStocks();
        var result = json.decode(response.body);
        List<Stocks> tempStockList = [];
        // print(result);
        result.forEach((data) {
          // stockList.add(Stocks.fromJson(data));
          tempStockList.add(Stocks.fromJson(data));
        });
        stockList.value = tempStockList;
        // stocks.value = currentStocks;
        isLoading.value = false;
        // stockListFiltered = await stockList;
        // isSearch.value ?? searchFilter("z");
        if (isSearch.value == true && searchText.value != "") {
          searchFilter(searchText.value);
        } else if (isSearch.value == false && searchText.value == "") {
          // searchFilter(searchText.value);
          stockListFiltered = stockList;
        } else {
          stockListFiltered = stockList;
        }
        // searchFilter("z");
      } catch (e) {
        // isLoading.value = true;
      }
    }
  }

  updateSearchStatus(bool val) {
    isSearch.value = val;
    update();
  }

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
    // isSearch.value = false;
    // stockList = stockListFiltered;
    update();
    // Get.back();
  }
}
