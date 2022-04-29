import 'dart:convert';

import 'package:getx_stocks_pse/app/data/models/market_data.dart';
// import 'current_price.dart';

class Crypto {
  String? id;
  String? symbol;
  String? name;
  MarketData? marketData;
  String? hasingAlgorithm;
  String? genesisDate;
  String? img;
  String? last_updated;

  Crypto({
    this.id,
    this.symbol,
    this.name,
    this.marketData,
    this.hasingAlgorithm,
    this.genesisDate,
    this.img,
    last_updated,
  });

  factory Crypto.fromJson(Map<String, dynamic> jsonData, SelectedCurrency) {
    return Crypto(
      id: jsonData['id'],
      symbol: jsonData['symbol'],
      name: jsonData['name'],
      marketData: MarketData.fromMap(jsonData['market_data'], SelectedCurrency),
      hasingAlgorithm: jsonData['hasing_algorithm'],
      genesisDate: jsonData['genesis_date'],
      img: jsonData['img'],
      last_updated: jsonData['last_updated'],
    );
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"] = id;
    data["tickerSymbol"] = symbol;
    data["companyName"] = name;
    data["img"] = img;
    data["last_updated"] = last_updated;
    return data;
  }
}

pricetoCryptoPrice(stockdate, low, open, close, high, volume, timestamp) {}
