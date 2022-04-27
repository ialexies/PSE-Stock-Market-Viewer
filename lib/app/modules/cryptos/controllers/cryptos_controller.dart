import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/data/models/cryptos_model.dart';

import 'package:getx_stocks_pse/app/data/services/cryptos_service.dart';
// import 'package:getx_stocks_pse/app/modules/stock/controllers/stock_controller.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class CryptosController extends GetxController {
  //TODO: Implement CryptosController

  // final count = 0.obs;
  var cryptoList = <Cryptos>[].obs;
  List<Cryptos> cryptoListFiltered = <Cryptos>[].obs;
  var stockStreamController = StreamController<Cryptos>().obs;
  var isStreamOn = true.obs;
  var stocks = Cryptos().obs;
  var isLoading = true.obs;
  var searchType = "Company Name".obs;
  var isSearch = false.obs;
  var searchText = "".obs;
  var currencies = <String>['USD', 'PHP'].obs;
  var currenciesSymbols = <String>['\$', 'Php'].obs;
  var currencySelected = "USD".obs;
  var currencySelectedSymbol = "\$".obs;
  var searchTextController = TextEditingController().obs;

  final CryptosService _stocksService = CryptosService();

  @override
  void onInit() {
    // fetchCryptos();
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
  Stream<Cryptos> stockStream() async* {
    while (isStreamOn.value == true) {
      await Future.delayed(Duration(milliseconds: 2000));
      try {
        // searchFilter("z");
        requestCryptosProvider();
      } catch (e) {
        // isLoading.value = true;
      }
    }
  }

  requestCryptosProvider() async {
    var response = await _stocksService.getCryptos(
        selectedCurrency: currencySelected.value);
    var result = json.decode(response.body);
    List<Cryptos> tempStockList = [];

    result.forEach((data) {
      tempStockList.add(Cryptos.fromJson(data));
    });
    cryptoList.value = tempStockList;

    isLoading.value = false;

    if (isSearch.value == true && searchText.value != "") {
      searchFilter(searchText.value);
    } else if (isSearch.value == false && searchText.value == "") {
      cryptoListFiltered = cryptoList;
    } else {
      cryptoListFiltered = cryptoList;
    }
  }

  updateSearchStatus(bool val) {
    isSearch.value = val;
    update();
  }

  clearSearch() async {
    searchTextController.value.text = "";
    searchText(searchTextController.value.text);
    requestCryptosProvider();
  }

  searchCryptos(String val) {
    searchTextController.value.text = val;
    requestCryptosProvider();
  }

  updateSearch(value) {
    if (value.isNotEmpty) {
      debugPrint('Something changed in Title Text Field');
      isSearch(true);
      searchText(searchTextController.value.text);
      requestCryptosProvider();
    } else {
      isSearch(false);
    }
  }

  updateCurrencySelected(String val) {
    if (val == "USD") {
      currencySelectedSymbol.value = "\$";
    } else if (val == "PHP") {
      currencySelectedSymbol.value = "P";
    }
    currencySelected.value = val;
    update();
  }

  void _getAllProducts() async {
    var stocks = await _stocksService.getCryptos();
    var result = json.decode(stocks.body);

    result.forEach((data) {
      cryptoList.add(Cryptos.fromJson(data));
    });
    isLoading(false);
    cryptoListFiltered = await cryptoList;
  }

  void searchFilter(String q) async {
    // _getAllProducts();
    List<Cryptos> tempStockAll = await cryptoList;
    List<Cryptos> filteredResult = [];

    filteredResult = tempStockAll
        .where((stock) => stock.companyName!
            .toLowerCase()
            .contains(q.toString().toLowerCase()))
        .toList();

    // filteredResult =

    // cryptoListFiltered.clear();
    cryptoListFiltered = filteredResult;
    // isSearch.value = false;
    // cryptoList = cryptoListFiltered;
    update();
    // Get.back();
  }
}