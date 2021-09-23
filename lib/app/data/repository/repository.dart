import 'package:http/http.dart' as http;

class Repository {
  // String _baseUrl = "https://pselookup.vrymel.com/api/stocks/";
  // String _baseUrl = "https://pselookup.vrymelhjyjyhjh.com";
  // String _baseUrl = "https://api.polygon.io/v3/reference/tickers";
  // String _baseUrl = "api.polygon.io";
  // String _baseUrl = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false";
  String _baseUrl = "api.coingecko.com";
  String _apiVersion = "v3";

  httpGet(
      {required String api,
      required Map<String, dynamic> queryParameters}) async {
    Uri url = Uri.parse(_baseUrl + api);

    // url.queryParameters.addAll(queryParameters);
    // url.queryParameters.values = queryParameters;
    url = Uri.http(_baseUrl, '/api/v3/' + api, queryParameters);

    return await http.get(
      url,
      // headers: {
      //   'Content-Type': 'application/json',
      //   'Accept': 'application/json',
      //   'Authorization': 'Bearer ${_bearerToken}',
      // },
    );
  }

  getBaseUrl() {
    return _baseUrl;
  }
}
