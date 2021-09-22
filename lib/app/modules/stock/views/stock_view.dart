import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ph_stocks_viewer/app/data/models/stock_model.dart';

import '../controllers/stock_controller.dart';

class StockView extends GetView<StockController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StockView'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          // child: Text(
          //   controller.getStockInfo(Get.arguments["tickerSymbol"].toString()),
          //   style: TextStyle(fontSize: 20),
          // ),
          child: FutureBuilder<Stock>(
              future: controller.getStockInfo(Get.arguments["tickerSymbol"]),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return ListView(
                    children: [
                      Text('${snapshot.data?.tickerSymbol.toString()}'),
                      Text('${snapshot.data?.companyName.toString()}'),
                      Text(
                          'Trading Date : Php ${snapshot.data?.price?["close"]}'),
                      Text('Low : Php ${snapshot.data?.price?["close"]}'),
                      Text('Open : Php ${snapshot.data?.price?["open"]}'),
                      Text('Close : Php ${snapshot.data?.price?["close"]}'),
                      Text('High : Php ${snapshot.data?.price?["high"]}'),
                      Text('Volume : Php ${snapshot.data?.price?["volume"]}'),
                      Text(
                          'Timestamp : Php ${snapshot.data?.price?["timestamp"]}'),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
