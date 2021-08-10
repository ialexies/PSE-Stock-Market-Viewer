import 'package:http/http.dart' as http;

class Repository {
  // String _baseUrl_pseLookup = "https://pselookup.vrymel.com/api/stocks/";
  String _baseUrl2 = "https://pselookup.vrymel.com";
  String _baseUrl = "http://phisix-api4.appspot.com/stocks.json";

  httpGetStocks({required String api}) async {
    // return await http.get(Uri.parse(_baseUrl + "/api" + api));
    return await http.get(Uri.parse(_baseUrl));
  }

  httpGetStock({required String api}) async {
    return await http.get(Uri.parse(_baseUrl2 + "/api" + api));
  }

  httpGetStockHistory({required String tickerSymbol}) async {
    // return await http.get(Uri.parse(_baseUrl + "/api" + api));
    //   return await http.get(Uri.parse(
    //       _baseUrl_pseLookup + "${tickerSymbol}/history/0000-00-00/2020-03-19"));
    // }
    return await http.get(Uri.parse(
        "https://pselookup.vrymel.com/api/stocks/ABS/history/0000-00-00/2020-03-19"));
  }

  getBaseUrl() {
    return _baseUrl;
  }
}
