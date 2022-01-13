import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/data/models/stock_history.dart';
import 'package:getx_stocks_pse/app/data/models/stock_model.dart';
import 'package:getx_stocks_pse/app/modules/stocks/controllers/stocks_controller.dart';

import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/stock_controller.dart';
import 'package:intl/intl.dart' as intl;

class StockView extends GetView<StockController> {
  StocksController stocksControlller = Get.put(StocksController());
  final decimalFormatter = intl.NumberFormat.decimalPattern();

  @override
  Widget build(BuildContext context) {
    
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: FittedBox(
              fit: BoxFit.fill,
              child: Image.network(
                '${controller.stockInfo.value.img}',
                width: 40,
              ),
            ),
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
                          Text(
                              '(${stocksControlller.currencySelectedSymbol} ${decimalFormatter.format(controller.stockInfo.value.price)})',
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
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  children: [
                                TextSpan(
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 14,
                                  ),
                                  text: 'Price: ',
                                  //   textAlign: TextAlign.left,
                                ),
                                TextSpan(
                                  text:
                                      '${stocksControlller.currencySelected.value} ${decimalFormatter.format(controller.stockInfo.value.price)} ',
                                  //   textAlign: TextAlign.left,
                                ),
                                TextSpan()
                              ])),
                          // Text(
                          //   'Price: ${stocksControlller.currencySelected.value} ',
                          //   textAlign: TextAlign.left,
                          // ),
                          // Text(
                          //   '${decimalFormatter.format(controller.stockInfo.value.price)}  ',
                          //   textAlign: TextAlign.left,
                          // ),
                          Text(
                              '24H High: ${stocksControlller.currencySelected.value} ${decimalFormatter.format(controller.stockInfo.value.high24h)}'),
                          Text(
                              '24H Low: ${stocksControlller.currencySelected.value} ${decimalFormatter.format(controller.stockInfo.value.low24h)}  '),
                          Text(
                              'Volume: ${controller.stockInfo.value.totalVolume}'),
                          // Text(
                          //     'Timestamp: ${controller.stockInfo.value.atlDate.toString()}'),
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
