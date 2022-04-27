import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Repository {
  // String _baseUrl_pseLookup = "https://pselookup.vrymel.com/api/stocks/";
  // String _baseUrl2 = "https://pselookup.vrymel.com";
  // String _baseUrl = "http://phisix-api4.appspot.com/stocks.json";
  String _baseUrl = "api.coingecko.com";
  String _apiVersion = "v3";

  httpGetCryptos({required String api, String selectedCurrency = "USD"}) async {
    // return await http.get(Uri.parse(_baseUrl + "/api" + api));

    Map<String, String> qParams = {
      // 'vs_currency': '$selectedCurrency',
      'vs_currency': '$selectedCurrency',
      'order': 'market_cap_desc',
      'per_page': '1000',
      'page': '1',
      'sparkline': 'false',
    };
    api = "/api/$_apiVersion/coins/markets";
    // api = "/api/$_apiVersion/coins/markets";

    final uri = Uri.https(
      _baseUrl,
      api,
      qParams,
    );
    return await http.get(uri);
  }

  httpGetCrypto({required String api, required String id}) async {
    // api = "/api/$_apiVersion/$api/";
    // return await http.get(Uri.parse(_baseUrl + api + symbol));
    String final_api =
        'https://$_baseUrl/api/$_apiVersion/$api/${id.toLowerCase()}';
    var response = http.get(Uri.parse(final_api));
    return response;
  }

  httpGetStockHistory({required String tickerSymbol}) async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dateFormatted = formatter.format(now);
    return await http.get(Uri.parse(
        "https://pselookup.vrymel.com/api/stocks/${tickerSymbol}/history/2021-01-19/${dateFormatted}"));
  }

  getBaseUrl() {
    return _baseUrl;
  }
}
