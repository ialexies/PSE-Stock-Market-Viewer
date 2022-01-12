import 'package:flutter/cupertino.dart';
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
    
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: Text(Get.arguments.name),
            // title: Text(Get.arguments.toString()),
            centerTitle: true,
          ),
          body: Center(
            child: Container(
                child: ListView(
              children: [
                // SafeArea(
                //     child: SfCartesianChart(

                //         zoomPanBehavior: controller.zoomPanBehavior.value,
                //         // backgroundColor: Colors.amberAccent[50],
                //         primaryXAxis:) DateTimeAxis(),
                //         enableAxisAnimation: true,
                //         indicators: <
                //             TechnicalIndicators<StockHistory, DateTime>>[
                //       RsiIndicator(
                //         dataSource: controller.stockHistoryList,
                //         xValueMapper: (StockHistory stockHistory, _) =>
                //             stockHistory.tradingDate,
                //         closeValueMapper:
                //             (StockHistory stockHistory, _) =>
                //                 stockHistory.close,
                //         highValueMapper: (StockHistory stockHistory, _) =>
                //             stockHistory.high,
                //         lowValueMapper: (StockHistory stockHistory, _) =>
                //             stockHistory.low,
                //       ),
                //       MacdIndicator(
                //         signalLineWidth: .3,
                //         macdLineWidth: .3,
                //         longPeriod: 200,
                //         shortPeriod: 7,
                //         macdLineColor: Colors.red,
                //         dataSource: controller.stockHistoryList,
                //         xValueMapper: (StockHistory stockHistory, _) =>
                //             stockHistory.tradingDate,
                //         closeValueMapper:
                //             (StockHistory stockHistory, _) =>
                //                 stockHistory.close,
                //       )
                //     ],
                //         series: <ChartSeries<StockHistory, DateTime>>[
                //       // Renders line chart
                //       LineSeries<StockHistory, DateTime>(
                //           width: 100,
                //           trendlines: <Trendline>[
                //             Trendline(
                //                 width: .1,
                //                 isVisible: true,
                //                 name: "trend",
                //                 color: Colors.yellow,
                //                 opacity: .3)
                //           ],
                //           dataSource: controller.stockHistoryList,
                //           xValueMapper: (StockHistory stockHistory, _) =>
                //               stockHistory.tradingDate,
                //           yValueMapper: (StockHistory stockHistory, _) =>
                //               stockHistory.close)
                //     ])),
                      Column(
                        children: [
                          Divider(),
                          ListTile(
                            leading: Column(
                              children: [
                                Text(
                                    '${controller.stockInfo.value.symbol} ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                          Text('(${controller.stockInfo.value.price})',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                            ),
                            title: Text(
                        '${controller.stockInfo.value.name}',
                       
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                          Text(
                            'Open: Php ${controller.stockInfo.value.price} Close: Php ${controller.stockInfo.value.price}  ',
                            textAlign: TextAlign.left,
                          ),
                          Text(
                              'High: Php ${controller.stockInfo.value.high24h} Low: Php ${controller.stockInfo.value.low24h}  '),
                          Text(
                              'Volume: ${controller.stockInfo.value.totalVolume}'),
                          Text(
                              'Timestamp: ${controller.stockInfo.value.lastUpdated}'),
                              ],
                            ),
                            // subtitle: Wrap(
                            //   // mainAxisSize: MainAxisSize.max,
                            //   children: [
                            //     Text(
                            //         'Low : Php ${snapshot.data?.price?["close"]}'),
                            //     Text(
                            //         'Open : Php ${snapshot.data?.price?["open"]}'),
                            //     Text(
                            //         'Close : Php ${snapshot.data?.price?["close"]}'),
                            //     Text(
                            //         'High : Php ${snapshot.data?.price?["high"]}'),
                            //   ],
                            // ),
                          ),
                        ],
                      ),
                    ],
            )
              
        ),
      ),
        ));
  }
}
