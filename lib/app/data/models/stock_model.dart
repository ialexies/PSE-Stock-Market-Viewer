class Stock {
  String? tickerSymbol;
  String? companyName;
  String? status;
  // Map<String, dynamic>? price;
  String? price;
  String? img;

  Stock(
      {this.tickerSymbol, this.companyName, this.status, this.price, this.img});

  factory Stock.fromJson(Map<String, dynamic> jsonData) {
    return Stock(
      tickerSymbol: jsonData['tickerSymbol'],
      companyName: jsonData['companyName'],
      status: jsonData['status'],
      price: jsonData['price'],
      img: jsonData['img'],
    );
    // price: pricetoStockPrice(
    // jsonData['price']["date"],
    // jsonData['price']["low"],
    // jsonData['price']["open"],
    // jsonData['price']["close"],
    // jsonData['price']["high"],
    // jsonData['price']["volume"],
    // jsonData['price']["timestamp"],
    // ));
  }

  // factory Stock.pricefromJson(Map<String, dynamic> json) {
  //   return Stock(

  //   );
  // }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["tickerSymbol"] = tickerSymbol;
    data["companyName"] = companyName;
    data["status"] = status;
    data["price"] = price;
    return data;
  }
}

//  pricetoStockPrice() {
//   DateTime? stockdate;
//   double? low;
//   double? open;
//   double? close;
//   double? high;
//   double? volume;
//   DateTime? timestamp;
// pricetoStockPrice(open);

pricetoStockPrice(stockdate, low, open, close, high, volume, timestamp) {}
