// class Stocks {
//   List<Stockss>? stockss;

//   Stocks({this.stockss});

//   Stocks.fromJson(Map<String, dynamic> json) {
//     if (json['stockss'] != null) {
//       stockss = <Stockss>[];
//       json['stockss'].forEach((v) {
//         stockss!.add(Stockss.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     if (stockss != null) {
//       data['stockss'] = stockss!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

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
    this.price,
    this.img,
    this.marketCap,
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
      tickerSymbol: json['symbol'],
      companyName: json['name'],
      img: json['image'],
      price: json['current_price'].toString(),
      marketCap: json['market_cap'].toString(),
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
