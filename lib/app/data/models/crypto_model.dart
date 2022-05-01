import 'dart:convert';

import 'package:getx_stocks_pse/app/data/models/market_data.dart';
import 'current_price.dart';

class Crypto {
  String? id;
  String? symbol;
  String? name;
  String? description;
  MarketData? marketData;
  String? hasingAlgorithm;
  String? genesisDate;
  String? sentimentVotesUpPercentage;
  String? sentimentVotesDownPercentage;
  CryptoImage? img;
  String? last_updated;

  Crypto({
    this.id,
    this.symbol,
    this.name,
    this.description,
    this.marketData,
    this.hasingAlgorithm,
    this.genesisDate,
    this.sentimentVotesUpPercentage,
    this.sentimentVotesDownPercentage,
    this.img,
    last_updated,
  });

  factory Crypto.fromJson(Map<String, dynamic> jsonData, SelectedCurrency) {
    return Crypto(
      id: jsonData['id'],
      symbol: jsonData['symbol'],
      name: jsonData['name'],
      description: jsonData['description']['en'],
      marketData: MarketData.fromMap(jsonData['market_data'], SelectedCurrency),
      hasingAlgorithm: jsonData['hasing_algorithm'],
      genesisDate: jsonData['genesis_date'],
      sentimentVotesUpPercentage:
          jsonData['sentiment_votes_up_percentage'].toString(),
      sentimentVotesDownPercentage:
          jsonData['sentiment_votes_down_percentage'].toString(),
      img: CryptoImage.fromMap(jsonData['image']),
      last_updated: jsonData['last_updated'],
    );
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["id"] = id;
    data["tickerSymbol"] = symbol;
    data["companyName"] = name;
    data["img"] = img;
    data["last_updated"] = last_updated;
    return data;
  }
}

class CryptoImage {
  String? thumb;
  String? small;
  String? large;
  CryptoImage({
    this.thumb,
    this.small,
    this.large,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (thumb != null) {
      result.addAll({'thumb': thumb});
    }
    if (small != null) {
      result.addAll({'small': small});
    }
    if (large != null) {
      result.addAll({'large': large});
    }

    return result;
  }

  factory CryptoImage.fromMap(Map<String, dynamic> map) {
    return CryptoImage(
      thumb: map['thumb'],
      small: map['small'],
      large: map['large'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoImage.fromJson(String source) =>
      CryptoImage.fromMap(json.decode(source));
}

// pricetoCryptoPrice(stockdate, low, open, close, high, volume, timestamp) {}
