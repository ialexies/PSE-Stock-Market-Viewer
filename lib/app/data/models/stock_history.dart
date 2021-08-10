class StockHistory {
  DateTime? tradingDate;
  // String tradingDate;
  double? low;
  double? open;
  double? close;
  double? high;
  double? volume;

  StockHistory(
      {required this.tradingDate,
      this.low,
      this.open,
      this.close,
      this.high,
      this.volume});

  factory StockHistory.fromJson(Map<String, dynamic> json) {
    return StockHistory(
      tradingDate: DateTime.parse(json['trading_date']),
      low: json['low'],
      open: json['open'],
      close: json['close'],
      high: json['high'],
      volume: json['volume'],
    );
  }
}
