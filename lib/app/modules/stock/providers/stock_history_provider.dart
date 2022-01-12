import 'package:get/get.dart';

import '../../../data/models/stock_history.dart';

class StockHistoryProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return StockHistory.fromJson(map);
      if (map is List)
        return map.map((item) => StockHistory.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<StockHistory?> getStockHistory(int id) async {
    final response = await get('stockhistory/$id');
    return response.body;
  }

  Future<Response<StockHistory>> postStockHistory(
          StockHistory stockhistory) async =>
      await post('stockhistory', stockhistory);
  Future<Response> deleteStockHistory(int id) async =>
      await delete('stockhistory/$id');
}
