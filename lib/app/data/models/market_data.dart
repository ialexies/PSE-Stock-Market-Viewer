import 'dart:convert';

class MarketData {
  String? currentPrice;
  String? marketCap;
  String? high24;
  String? low24;

  MarketData({
    this.currentPrice,
    this.marketCap,
    this.high24,
    this.low24,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (currentPrice != null) {
      result.addAll({'currentPrice': currentPrice});
    }

    return result;
  }

  factory MarketData.fromMap(
      Map<String, dynamic> map, String selectedCurrency) {
    final marketData = MarketData(
      currentPrice: map['current_price'][selectedCurrency].toString(),
      marketCap: map['market_cap'][selectedCurrency].toString(),
      high24: map["high_24h"]["usd"].toString(),
      low24: map["low_24h"]["usd"].toString(),
    );
    return marketData;
  }

  String toJson() => json.encode(toMap());

  factory MarketData.fromJson(String source, String ticker) =>
      MarketData.fromMap(json.decode(source), ticker);
}
