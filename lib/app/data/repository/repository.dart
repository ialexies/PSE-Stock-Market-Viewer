import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Repository {
  // String _baseUrl_pseLookup = "https://pselookup.vrymel.com/api/stocks/";
  String _baseUrl2 = "https://pselookup.vrymel.com";
  // String _baseUrl = "http://phisix-api4.appspot.com/stocks.json";
  String _baseUrl = "api.coingecko.com";

  httpGetStocks({required String api, String selectedCurrency = "USD"}) async {
    // return await http.get(Uri.parse(_baseUrl + "/api" + api));

    Map<String, String> qParams = {
      // 'vs_currency': '$selectedCurrency',
      'vs_currency': '$selectedCurrency',
      'order': 'market_cap_desc',
      'per_page': '1000',
      'page': '1',
      'sparkline': 'false',
    };

    api = "/api/v3/coins/markets";

    final uri = Uri.https(
      _baseUrl,
      api,
      qParams,
    );
    return await http.get(uri);
  }

  httpGetStock({required String api}) async {
    // return await http.get(Uri.parse(_baseUrl + "/api/v3/" + api.toLowerCase()));
    api = "/api/v3/$api";
    return await http.get(Uri.https(_baseUrl, api));
  }

  httpGetStockHistory({required String api}) async {
    final DateTime now = DateTime.now();
    print(_baseUrl + api);

    Map<String, String> qParams = {
      // 'vs_currency': '$selectedCurrency',
      'vs_currency': 'php',
      'from': '1392577232',
      'to': '1422577232',
    };
    http.Response result = await http.get(Uri.https(_baseUrl, api, qParams));
    print(result);
    return result;
  }

  // httpGetStockHistory({required String tickerSymbol}) async {
  //   final DateTime now = DateTime.now();
  //   final DateFormat formatter = DateFormat('yyyy-MM-dd');
  //   final String dateFormatted = formatter.format(now);
  //   return await http.get(Uri.parse(
  //       "https://pselookup.vrymel.com/api/stocks/${tickerSymbol}/history/2021-01-19/${dateFormatted}"));
  // }

  getBaseUrl() {
    return _baseUrl;
  }
}
