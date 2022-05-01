import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/core/values/const.dart';
import 'package:getx_stocks_pse/app/data/models/cryptos_model.dart';
import 'package:getx_stocks_pse/app/data/services/cryptos_service.dart';
import 'dart:convert';

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
  var currencies = ConstantData.currencies;
  var currenciesSymbols = <String>['\$', 'Php'].obs;
  var currencySelected = "usd".obs;
  var currencySelectedSymbol = "\$".obs;
  var selectedCryptoImage = "".obs;
  var searchTextController = TextEditingController().obs;
  var initDuration = 1.obs;
  var shouldPop = false.obs;

  final CryptosService _stocksService = CryptosService();

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
  Stream<Cryptos> stockStream() async* {
    while (isStreamOn.value == true) {
      await Future.delayed(Duration(milliseconds: initDuration.value));
      try {
        // searchFilter("z");
        faetchCryptos();
      } catch (e) {
        // isLoading.value = true;
      }
      initDuration.value = 5000;
      update();
      // print('stream count');
    }
  }

  faetchCryptos() async {
    var response = await _stocksService.getCryptos(
        selectedCurrency: currencySelected.value);
    var result = response.data;
    List<Cryptos> tempStockList = [];

    result.forEach((data) {
      tempStockList.add(Cryptos.fromJson(data));
    });
    cryptoList.value = tempStockList;

    List<Cryptos> selectedCryptoImageList = tempStockList
        .where((element) => element.tickerSymbol == currencySelected.value)
        .toList();

    selectedCryptoImage.value = selectedCryptoImageList.length > 0
        ? selectedCryptoImageList[0].img.toString()
        : "";

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
    faetchCryptos();
  }

  searchCryptos(String val) {
    searchTextController.value.text = val;
    faetchCryptos();
  }

  updateSearch(value) {
    if (value.isNotEmpty) {
      debugPrint('Something changed in Title Text Field');
      isSearch(true);
      searchText(searchTextController.value.text);
      faetchCryptos();
    } else {
      isSearch(false);
    }
  }

  updateCurrencySelected(String val) {
    if (val == "usd") {
      currencySelectedSymbol.value = "\$";
      // currencySelectedIcon.value = CryptoFontIcons.usd
    } else if (val == "php") {
      currencySelectedSymbol.value = "P";
    } else if (val == "btc") {
      currencySelectedSymbol.value = "";
      // currencySelectedIcon.value = CryptoFontIcons.BTC;
    } else {
      currencySelectedSymbol.value = "";
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
