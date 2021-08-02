import 'package:http/http.dart' as http;

class Repository {
  // String _baseUrl = "https://pselookup.vrymel.com/api/stocks/";
  String _baseUrl = "https://pselookup.vrymel.com";

  httpGet({required String api}) async {
    // return await http.get(Uri.parse(_baseUrl + "/api" + api));
    return await http.get(Uri.parse(_baseUrl + "/api" + api));
    // return await http.get(Uri.parse(_baseUrl));
  }

  getBaseUrl() {
    return _baseUrl;
  }
}
