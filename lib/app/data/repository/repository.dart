import 'package:http/http.dart' as http;

class Repository {
  // String _baseUrl = "https://pselookup.vrymel.com/api/stocks/";
  // String _baseUrl = "https://pselookup.vrymel.com";
  String _baseUrl = "http://phisix-api4.appspot.com/stocks.json";
  String _baseUrl_pseLookup = "https://pselookup.vrymel.com/api/stocks/";

  httpGet({required String api}) async {
    // return await http.get(Uri.parse(_baseUrl + "/api" + api));
    return await http.get(Uri.parse(_baseUrl));
  }

  httpGetStockHistory({required String tickerSymbol}) async {
    return await http.get(Uri.parse(
        "https://pselookup.vrymel.com/api/stocks/ABS/history/0000-00-00/2020-03-19"));
  }

  getBaseUrl() {
    return _baseUrl;
  }
}
