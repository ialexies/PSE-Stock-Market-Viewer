import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:getx_stocks_pse/app/modules/cryptos/controllers/cryptos_controller.dart';

import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher.dart';

class Helpers {
  selectedCurrency() {
    final CryptosController cryptosController = Get.put(CryptosController());

    return cryptosController.currencySelected.toUpperCase();
  }

  moneyFormatter(amountString) {
    final decimalFormatter = intl.NumberFormat.decimalPattern();
    double amount = double.parse(amountString);
    String formattedAmount = decimalFormatter.format(amount);
    return formattedAmount;
  }

  urLauncher(Uri url) async {
    if (!await launchUrl(url)) throw 'Could not launch $url';
  }

  Text percent24ChangeChecker(numChange, double fSize) {
    return Text('${double.parse(numChange.toString()).toStringAsFixed(2)}%',
        style: TextStyle(
          fontSize: fSize,
          fontWeight: FontWeight.w500,
          color: double.parse(numChange.toString()) >= 1
              ? Colors.blue
              : Colors.red,
        ));
  }
}
