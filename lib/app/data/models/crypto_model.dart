class Crypto {
  String? tickerSymbol;
  String? companyName;
  String? status;
  // Map<String, dynamic>? price;
  String? price;
  String? img;

  Crypto(
      {this.tickerSymbol, this.companyName, this.status, this.price, this.img});

  factory Crypto.fromJson(Map<String, dynamic> jsonData) {
    return Crypto(
      tickerSymbol: jsonData['tickerSymbol'],
      companyName: jsonData['companyName'],
      status: jsonData['status'],
      price: jsonData['price'],
      img: jsonData['img'],
    );
    // price: pricetoCryptoPrice(
    // jsonData['price']["date"],
    // jsonData['price']["low"],
    // jsonData['price']["open"],
    // jsonData['price']["close"],
    // jsonData['price']["high"],
    // jsonData['price']["volume"],
    // jsonData['price']["timestamp"],
    // ));
  }

  // factory Crypto.pricefromJson(Map<String, dynamic> json) {
  //   return Crypto(

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

//  pricetoCryptoPrice() {
//   DateTime? stockdate;
//   double? low;
//   double? open;
//   double? close;
//   double? high;
//   double? volume;
//   DateTime? timestamp;
// pricetoCryptoPrice(open);

pricetoCryptoPrice(stockdate, low, open, close, high, volume, timestamp) {}
