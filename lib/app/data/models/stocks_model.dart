class Stocks {
  String? tickerSymbol;
  String? companyName;
  String? price;
  String? img;
  String? marketCap;
  // bool? status;
  String? marketCapRank;
  String? fullyDilutedValuation;
  String? totalVolume;
  String? high24h;
  String? low24h;
  String? priceChange24h;
  String? priceChangePercentage24h;
  String? marketCapChange24h;
  String? marketCapChangePercentage24h;
  String? circulatingCupply;
  String? totalSupply;
  String? maxSupply;
  String? ath;
  String? athChangePercentage;
  String? athDate;
  String? atl;
  String? atlChangePercentage;
  String? atlDate;
  String? roi;
  String? lastUpdated;

  Stocks({
    this.tickerSymbol,
    this.companyName,
    this.marketCap,
    this.price,
    this.high24h,
    this.low24h,
    this.totalVolume,
    this.totalSupply,
    this.img,
  });

  // factory Stocks.fromJson(Map<String, dynamic> json) {
  //   return Stocks(
  //     tickerSymbol: json['ticker_symbol'],
  //     companyName: json['company_name'],
  //     status: json['status'],
  //   );
  // }

  // US Stocks
  factory Stocks.fromJson(Map<String, dynamic> json) {
    return Stocks(
      // tickerSymbol: json['ticker_symbol'],
      tickerSymbol: json['symbol'],
      // companyName: json['company_name'],
      companyName: json['name'],
      marketCap: json['market_cap'].toString(),
      price: json['current_price'].toString(),
      high24h: json['high_24h'].toString(),
      low24h: json['low_24h'].toString(),
      totalVolume: json['total_volume'].toString(),
      totalSupply: json['total_supply'].toString(),
      img: json['image'],
      // status: json['active'],
      // status: json['active'] == 'true',
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ticker_symbol'] = tickerSymbol;
    data['company_name'] = companyName;
    // data['status'] = status;
    return data;
  }
}
