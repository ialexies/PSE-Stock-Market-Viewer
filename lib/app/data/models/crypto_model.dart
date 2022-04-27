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
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["tickerSymbol"] = symbol;
    data["companyName"] = name;
    // data["status"] = status;
    data["price"] = price;
    return data;
  }
}

pricetoCryptoPrice(stockdate, low, open, close, high, volume, timestamp) {}
