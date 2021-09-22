import 'package:ph_stocks_viewer/app/data/repository/repository.dart';

class StocksService {
  Repository _repository = Repository();

  getStocks() async {
    return await _repository.httpGet(api: "/stocks");
  }
}
