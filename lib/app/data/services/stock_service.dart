import 'package:getx_stocks_pse/app/data/repository/repository.dart';

class StockService {
  Repository repository = Repository();

  getStock(tickerSymbol) async {
    // return await repository.httpGet(api: "/stocks/${tickerSymbol}");
    // return await repository.httpGet(api: "/stocks/${tickerSymbol}");
    var queryParameters = {
      '': '',
      // 'order': 'asc',
      // 'active': 'true',
      // 'sort': 'ticker',
      // 'market': 'crypto',
      // 'limit': '1000'
    };
    return await repository.httpGet(
        api: "meta/symbols/AAPL/company", queryParameters: queryParameters);
  }
}
