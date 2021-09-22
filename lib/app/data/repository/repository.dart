import 'package:http/http.dart' as http;

class Repository {
  // String _baseUrl = "https://pselookup.vrymel.com/api/stocks/";
  // String _baseUrl = "https://pselookup.vrymelhjyjyhjh.com";
  // String _baseUrl = "https://api.polygon.io/v3/reference/tickers";
  String _baseUrl = "api.polygon.io";
  String _bearerToken = "Nh3wApx1pTHZgA08rWnTm6mrwDZQEHCz";
  String _apiVersion = "v3";

  httpGet({required String api}) async {
    // return await http.get(Uri.parse(_baseUrl + "/api" + api));
    // return await http.get(Uri.parse(_baseUrl + "/api" + api));

    Uri url = Uri.parse(_baseUrl + api);
    var queryParameters = {
      'order': 'asc',
      'active': 'true',
      'sort': 'ticker',
      'market': 'crypto',
      'limit': '1000'
    };
    // url.queryParameters.addAll(queryParameters);
    // url.queryParameters.values = queryParameters;
    url = Uri.http(_baseUrl, '/$_apiVersion/' + api, queryParameters);

    return await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${_bearerToken}',
    });
    // return await http.get(Uri.parse(_baseUrl));
  }

  getBaseUrl() {
    return _baseUrl;
  }
}
