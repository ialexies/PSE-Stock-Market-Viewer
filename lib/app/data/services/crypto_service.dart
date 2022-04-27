import 'package:getx_stocks_pse/app/data/repository/repository.dart';

class CryptoService {
  Repository repository = Repository();

  getCrypto(api, tickerSymbol) async {
    // return await repository.httpGet(api: "/stocks/${tickerSymbol}");
    // return await repository.httpGetStock(api: "/stocks/${tickerSymbol}");
    return await repository.httpGetCrypto(api: api, symbol: tickerSymbol);
  }
}
