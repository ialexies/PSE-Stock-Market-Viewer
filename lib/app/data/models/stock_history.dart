class StockHistory {
  List<dynamic> prices;
  List<dynamic> market_caps;
  List<dynamic> total_volumes;
  StockHistory({
    required this.prices,
    required this.market_caps,
    required this.total_volumes,
  });

  factory StockHistory.fromJson(Map<String, dynamic> jsonData) {
    return StockHistory(
        prices: jsonData['prices'],
        market_caps: jsonData['market_caps'],
        total_volumes: jsonData['total_volumes']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['prices'] = prices;
    data['market_caps'] = market_caps;
    data['total_vaolumes'] = total_volumes;
    return data;
  }



  // StockHistory({
  //   required this.prices,
  // });

  // DateTime? tradingDate;
  // double? low;
  // double? open;
  // double? close;
  // double? high;
  // double? volume;

  // StockHistory(
  //     {required this.tradingDate,
  //     this.low,
  //     this.open,
  //     this.close,
  //     this.high,
  //     this.volume});

  // factory StockHistory.fromJson(Map<String, dynamic> json) {
  //   return StockHistory(
  //     tradingDate: DateTime.parse(json['trading_date']),
  //     low: json['low'],
  //     open: json['open'],
  //     close: json['close'],
  //     high: json['high'],
  //     volume: json['volume'],
  //   );
  // }
}
