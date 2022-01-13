import 'package:cryptos/app/data/repository/repository.dart';

class StocksService {
  Repository _repository = Repository();

  getStocks({selectedCurrency}) async {
    // print(selectedCurrency);
    return await _repository.httpGetStocks(
        api: "/stocks", selectedCurrency: selectedCurrency);
  }
}
