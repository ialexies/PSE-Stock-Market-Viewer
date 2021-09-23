import 'package:getx_stocks_pse/app/data/repository/repository.dart';

class StocksService {
  Repository _repository = Repository();

  getStocks() async {
    var queryParameters = {
      // 'order': 'asc',
      // 'active': 'true',
      // 'sort': 'ticker',
      // 'market': 'crypto',
      // 'limit': '1000'
      'vs_currency': 'usd',
      'order': 'market_cap_desc',
      'per_page': '100',
      'page': '1',
      'sparkline': 'false',
    };
    return await _repository.httpGet(
        api: "coins/markets", queryParameters: queryParameters);
  }
}
