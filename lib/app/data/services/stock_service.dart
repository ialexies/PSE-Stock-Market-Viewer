import 'package:ph_stocks_viewer/app/data/repository/repository.dart';

class StockService {
  Repository repository = Repository();

  getStock(tickerSymbol) async {
    // return await repository.httpGet(api: "/stocks/${tickerSymbol}");
    // return await repository.httpGet(api: "/stocks/${tickerSymbol}");
    return await repository.httpGet(api: "meta/symbols/AAPL/company");
  }
}
