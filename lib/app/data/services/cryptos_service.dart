import 'package:dio/dio.dart';
import 'package:getx_stocks_pse/app/data/repository/repository.dart';

class CryptosService {
  Repository _repository = Repository();

  getCryptos({selectedCurrency}) async {
    return await _repository.httpGetCryptos(
        api: "/stocks", selectedCurrency: selectedCurrency);
  }
}
