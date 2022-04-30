import 'dart:convert';

class MarketData {
  String? currentPrice;
  String? marketCap;
  String? high24;
  String? high24Change;
  String? high24ChangePercentage;
  String? low24;
  String? totalVolume;

  MarketData({
    this.currentPrice,
    this.marketCap,
    this.high24,
    this.high24Change,
    this.high24ChangePercentage,
    this.low24,
    this.totalVolume,
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
      high24: map["high_24h"][selectedCurrency].toString(),
      high24Change: map["price_change_24h"].toString(),
      high24ChangePercentage: map["price_change_percentage_24h"].toString(),
      low24: map["low_24h"][selectedCurrency].toString(),
      totalVolume: map["total_volume"][selectedCurrency].toString(),
    );
    return marketData;
  }

  String toJson() => json.encode(toMap());

  factory MarketData.fromJson(String source, String ticker) =>
      MarketData.fromMap(json.decode(source), ticker);
}
