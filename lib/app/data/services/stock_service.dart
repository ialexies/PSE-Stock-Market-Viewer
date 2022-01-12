import 'dart:convert';

import 'package:getx_stocks_pse/app/data/repository/repository.dart';

import '../models/stock_history.dart';


class StockService {
  Repository repository = Repository();

  getStock(stockData) async {
    return await repository.httpGetStock(api: "coins/${stockData.id}");
  }

  getStockHistory(stockData) async {
    var response = await repository.httpGetStockHistory(
        api: "/api/v3/coins/${stockData.id}/market_chart/range");

    var result = json.decode(response.body);

    return StockHistory.fromJson(result);
  }
}
