import 'package:getx_stocks_pse/app/data/repository/repository.dart';

class CryptosService {
  Repository _repository = Repository();

  getCryptos({selectedCurrency}) async {
    // print(selectedCurrency);
    return await _repository.httpGetStocks(
        api: "/stocks", selectedCurrency: selectedCurrency);
  }
}
