import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/data/models/stock_history.dart';
import 'package:getx_stocks_pse/app/data/models/stock_model.dart';

import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/stock_controller.dart';

class StockView extends GetView<StockController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Get.arguments["tickerSymbol"]),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: FutureBuilder<Stock>(
              future: controller.getStockInfo(Get.arguments["tickerSymbol"]),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return ListView(
                    children: [
                      // Text('${snapshot.data?.tickerSymbol.toString()}'),
                      // Text('${snapshot.data?.companyName.toString()}'),
                      // Text(
                      //     'Trading Date : Php ${snapshot.data?.price?["close"]}'),
                      // Text('Low : Php ${snapshot.data?.price?["close"]}'),
                      // Text('Open : Php ${snapshot.data?.price?["open"]}'),
                      // Text('Close : Php ${snapshot.data?.price?["close"]}'),
                      // Text('High : Php ${snapshot.data?.price?["high"]}'),
                      // Text('Volume : Php ${snapshot.data?.price?["volume"]}'),
                      // Text(
                      //     'Timestamp : Php ${snapshot.data?.price?["timestamp"]}'),

                      SafeArea(
                          child: SfCartesianChart(
                              primaryXAxis: DateTimeAxis(),
                              series: <ChartSeries<StockHistory, DateTime>>[
                            // Renders line chart
                            LineSeries<StockHistory, DateTime>(
                                dataSource: controller.stockHistoryList,
                                xValueMapper: (StockHistory stockHistory, _) =>
                                    stockHistory.tradingDate,
                                yValueMapper: (StockHistory stockHistory, _) =>
                                    stockHistory.close)
                          ])),
                      // Text('${snapshot.data?.tickerSymbol.toString()}'),
                      // Text('${snapshot.data?.companyName.toString()}'),
                      // Text(
                      //     'Trading Date : Php ${snapshot.data?.price?["close"]}'),
                      // Text('Low : Php ${snapshot.data?.price?["close"]}'),
                      // Text('Open : Php ${snapshot.data?.price?["open"]}'),
                      // Text('Close : Php ${snapshot.data?.price?["close"]}'),
                      // Text('High : Php ${snapshot.data?.price?["high"]}'),
                      // Text('Volume : Php ${snapshot.data?.price?["volume"]}'),
                      // Text(
                      //     'Timestamp : Php ${snapshot.data?.price?["timestamp"]}'),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
