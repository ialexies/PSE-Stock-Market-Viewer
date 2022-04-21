class Stocks {
  String? tickerSymbol;
  String? companyName;
  double? price;
  String? img;
  String? marketCap;
  String? marketCapRank;
  String? fullyDilutedValuation;
  String? totalVolume;
  double? high24h;
  double? low24h;
  String? priceChange24h;
  double? priceChangePercentage24h;
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
    this.price,
    this.high24h,
    this.low24h,
    this.priceChangePercentage24h,
    this.img,
    this.marketCap,
    this.totalVolume,
  });

  // US Stocks
  factory Stocks.fromJson(Map<String, dynamic> json) {
    return Stocks(
      tickerSymbol: json['symbol'],
      companyName: json['name'],
      price: json['current_price'].toDouble(),
      high24h: json['high_24h'].toDouble(),
      low24h: json['low_24h'].toDouble(),
      priceChangePercentage24h: json['price_change_percentage_24h'],
      img: json['image'],
      marketCap: json['market_cap'].toString(),
      totalVolume: json['total_volume'].toString(),
    );
  }

  Map<String, String> toJson() {
    final data = <String, String>{};
    data['tickerSymbol'] = tickerSymbol.toString();
    data['companyName'] = companyName.toString();
    data['price'] = price.toString();
    data['high24h'] = high24h.toString();
    data['low24h'] = low24h.toString();
    data['priceChangePercentage24h'] = priceChangePercentage24h.toString();
    data['img'] = img.toString();
    data['marketCap'] = marketCap.toString();
    data['totalVolume'] = totalVolume.toString();

    return data;
  }
}
