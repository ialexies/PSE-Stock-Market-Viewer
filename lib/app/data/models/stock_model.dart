import 'dart:convert';

import 'package:flutter/foundation.dart';

class Stock {
  String? id;
  String? symbol;
  String? name;
  String? descryption;
  String? status;
  int? market_cap_rank;
  int? market_cap;
  Map<String, Map<String, double>>? market_data;

  Map<String, dynamic>? ticker;
  double? current_price;

  Stock({
    this.id,
    this.symbol,
    this.name,
    this.descryption,
    this.status,
    this.market_cap_rank,
    this.market_cap,
    this.market_data,
    this.ticker,
    this.current_price,
  });

  factory Stock.fromJson(Map<String, dynamic> jsonData) {
    print(double.parse(
        jsonData["market_data"]["current_price"]["usd"].toString()));   
    return Stock(
        id: jsonData['id'],
        symbol: jsonData['symbol'],
        name: jsonData['name'],
        descryption: jsonData['description']['en'],
        status: jsonData['status'],
        market_cap_rank: jsonData['market_cap_rank'],
        ticker: jsonData["tickers"][0],
        current_price: double.parse(
            jsonData["market_data"]["current_price"]["usd"].toString()));
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["symbol"] = symbol;
    data["name"] = name;
    data["status"] = status;
    data["ticker"] = ticker;
    return data;
  }
}

class MarketData {
  Map<String, double> current_price;
  double price_change_24h;
  double price_change_percentage_24h;
  MarketData({
    required this.current_price,
    required this.price_change_24h,
    required this.price_change_percentage_24h,
  });

  Map<String, dynamic> toMap() {
    return {
      'current_price': current_price,
      'price_change_24h': price_change_24h,
      'price_change_percentage_24h': price_change_percentage_24h,
    };
  }

  factory MarketData.fromMap(Map<String, dynamic> map) {
    return MarketData(
      current_price: Map<String, double>.from(map['current_price']),
      price_change_24h: map['price_change_24h']?.toDouble() ?? 0.0,
      price_change_percentage_24h:
          map['price_change_percentage_24h']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MarketData.fromJson(String source) =>
      MarketData.fromMap(json.decode(source));

  @override
  String toString() =>
      'MarketData(current_price: $current_price, price_change_24h: $price_change_24h, price_change_percentage_24h: $price_change_percentage_24h)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MarketData &&
        mapEquals(other.current_price, current_price) &&
        other.price_change_24h == price_change_24h &&
        other.price_change_percentage_24h == price_change_percentage_24h;
  }

  @override
  int get hashCode =>
      current_price.hashCode ^
      price_change_24h.hashCode ^
      price_change_percentage_24h.hashCode;
}

pricetoStockPrice(stockdate, low, open, close, high, volume, timestamp) {}

class Ticker {
  String base;
  String target;
  double last;
  double volume;

  Ticker(this.base, this.target, this.last, this.volume);
}
