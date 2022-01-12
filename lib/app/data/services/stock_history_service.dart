import 'package:getx_stocks_pse/app/data/repository/repository.dart';

class StockHistoryService {
  Repository repository = Repository();

  getStockHistoryAll(tickerSymbol) async {
    // return await repository.httpGet(api: "/stocks/${tickerSymbol}");
    return await repository.httpGetStockHistory(api: tickerSymbol);
  }
}
