import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ApiFailure implements Exception {
  const ApiFailure([this.message = 'An unknown exception occurred']);

  final String message;
}

class ApiTimeoutFailure implements ApiFailure {
  @override
  String get message => 'Connection timed out';
}

class Repository {
  final String _baseUrl = "api.coingecko.com";
  final String _apiVersion = "v3";

  httpGetCryptos({required String api, String selectedCurrency = "USD"}) async {
    Map<String, String> qParams = {
      'vs_currency': '$selectedCurrency',
      'order': 'market_cap_desc',
      'per_page': '1000',
      'page': '1',
      'sparkline': 'false',
    };
    api = "/api/$_apiVersion/coins/markets";

    final uri = Uri.https(
      _baseUrl,
      api,
      qParams,
    );

    try {
      var response = await Dio().get(uri.toString());

      return response;
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          throw ApiTimeoutFailure();
        case DioErrorType.response:
        case DioErrorType.cancel:
        case DioErrorType.other:
          rethrow;
      }
    }
  }

  httpGetCrypto({required String api, required String id}) async {
    // String final_api =
    //     'https://$_baseUrl/api/$_apiVersion/$api/${id.toLowerCase()}';

    api = "/api/$_apiVersion/$api/${id.toLowerCase()}";
    final uri = Uri.https(
      _baseUrl,
      api,
      // qParams,
    );

    try {
      var response = await Dio().get(uri.toString());

      return response;
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          throw ApiTimeoutFailure();
        case DioErrorType.response:
        case DioErrorType.cancel:
        case DioErrorType.other:
          rethrow;
      }
    }

    // var response = http.get(Uri.parse(final_api));
    // return response;
  }

  httpGetStockHistory({required String tickerSymbol}) async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dateFormatted = formatter.format(now);
    return await http.get(Uri.parse(
        "https://api.coingecko.com/api/v3/coins/bitcoin/market_chart/range?vs_currency=usd&from=1392577232&to=1422577232"));
    // return await http.get(Uri.parse(
    //     "https://pselookup.vrymel.com/api/stocks/${tickerSymbol}/history/2021-01-19/${dateFormatted}"));
  }

  getBaseUrl() {
    return _baseUrl;
  }
}
