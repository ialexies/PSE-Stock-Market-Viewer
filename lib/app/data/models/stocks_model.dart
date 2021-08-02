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
  String? status;

  Stocks({this.tickerSymbol, this.companyName, this.status});

  factory Stocks.fromJson(Map<String, dynamic> json) {
    return Stocks(
      tickerSymbol: json['ticker_symbol'],
      companyName: json['company_name'],
      status: json['status'],
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
