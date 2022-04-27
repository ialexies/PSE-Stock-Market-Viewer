import 'package:getx_stocks_pse/app/data/repository/repository.dart';

class CryptoService {
  Repository repository = Repository();

  getCrypto(api, id) async {
    // return await repository.httpGet(api: "/stocks/${tickerSymbol}");
    // return await repository.httpGetStock(api: "/stocks/${tickerSymbol}");
    return repository.httpGetCrypto(api: api, id: id);
  }
}
