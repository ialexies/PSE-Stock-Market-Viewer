import 'package:getx_stocks_pse/app/data/repository/repository.dart';

class StocksService {
  Repository _repository = Repository();

  getStocks() async {
    return await _repository.httpGet(api: "/stocks");
  }
}
