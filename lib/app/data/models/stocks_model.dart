class Stocks {
  String? tickerSymbol;
  String? companyName;
  String? status;
  double? currentPrice;
  String? currency;
  double? dayChange;
  int? volume;

  // Stocks({this.tickerSymbol, this.companyName, this.status});
  Stocks(
      {this.tickerSymbol,
      this.companyName,
      this.currentPrice,
      this.currency,
      this.dayChange,
      this.volume});

  factory Stocks.fromJson(Map<String, dynamic> json) {
    return Stocks(
      // tickerSymbol: json['ticker_symbol'],
      tickerSymbol: json['symbol'],
      // companyName: json['company_name'],
      companyName: json['name'],
      currentPrice: json['price']['amount'],
      currency: json['price']['currency'],
      dayChange: json['percent_change'],
      volume: json['volume'],
      // status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ticker_symbol'] = tickerSymbol;
    data['company_name'] = companyName;
    data['status'] = status;
    return data;
  }
}
