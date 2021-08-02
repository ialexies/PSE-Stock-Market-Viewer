// import 'package:get/get.dart';
// import 'package:getx_stocks_pse/app/data/models/stock_model.dart';

// class StockProvider extends GetConnect {
//   @override
//   void onInit() {
//     httpClient.defaultDecoder = (map) {
//       if (map is Map<String, dynamic>) return Stock.fromJson(map);
//       if (map is List) return map.map((item) => Stock.fromJson(item)).toList();
//     };
//     httpClient.baseUrl = 'https://pselookup.vrymel.com/api/stocks/';
//   }

//   Future<Stock?> getStock(int id) async {
//     final response = await get('stock/$id');
//     return response.body;
//   }

//   Future<Stock?> getStocks() async {
//     final response = await get('stock/');
//     return response.body;
//   }

//   Future<Response<Stock>> postStock(Stock stock) async =>
//       await post('stock', stock);
//   Future<Response> deleteStock(int id) async => await delete('stock/$id');
// }
