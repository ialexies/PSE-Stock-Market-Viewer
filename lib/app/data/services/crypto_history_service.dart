import 'package:getx_stocks_pse/app/data/repository/repository.dart';

class CryptoHistoryService {
  Repository repository = Repository();

  getCryptoHistoryAll(tickerSymbol) async {
    // return await repository.httpGet(api: "/stocks/${tickerSymbol}");
    return await repository.httpGetStockHistory(tickerSymbol: tickerSymbol);
  }
}
