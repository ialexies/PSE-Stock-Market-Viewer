import 'dart:convert';

class MarketData {
  String? currentPrice;

  String? roi;

  MarketData({
    this.currentPrice,
    this.roi,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (currentPrice != null) {
      result.addAll({'currentPrice': currentPrice});
    }

    if (roi != null) {
      result.addAll({'roi': roi});
    }

    return result;
  }

  factory MarketData.fromMap(
      Map<String, dynamic> map, String selectedCurrency) {
    final marketData = MarketData(
      currentPrice: map['current_price'][selectedCurrency].toString(),
      roi: map['roi'],
    );
    return marketData;
  }

  String toJson() => json.encode(toMap());

  factory MarketData.fromJson(String source, String ticker) =>
      MarketData.fromMap(json.decode(source), ticker);
}
