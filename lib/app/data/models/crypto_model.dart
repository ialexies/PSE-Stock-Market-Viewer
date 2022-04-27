class Crypto {
  String? symbol;
  String? name;

  // Map<String, dynamic>? price;
  String? price;
  String? img;

  Crypto({this.symbol, this.name, this.price, this.img});

  factory Crypto.fromJson(Map<String, dynamic> jsonData) {
    return Crypto(
      symbol: jsonData['symbol'],
      name: jsonData['name'],
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
    data["tickerSymbol"] = symbol;
    data["companyName"] = name;
    // data["status"] = status;
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
