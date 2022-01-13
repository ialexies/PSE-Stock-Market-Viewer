import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:cryptos/app/data/models/stock_history.dart';
import 'package:cryptos/app/data/models/stock_model.dart';
import 'package:cryptos/app/modules/stocks/controllers/stocks_controller.dart';

import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../controllers/stock_controller.dart';
import 'package:intl/intl.dart' as intl;


class StockView extends GetView<StockController> {
  StocksController stocksControlller = Get.put(StocksController());
  final decimalFormatter = intl.NumberFormat.decimalPattern();

  @override
  Widget build(BuildContext context) {
    // print('fdfdf');

    this.controller.getStockInfoMore(Get.arguments);

    return Obx(() => Scaffold(
          appBar: AppBar(
            // title: CircleAvatar(
            //   backgroundImage: NetworkImage(
            //     '${controller.stockInfo.value.img}',
            //   ),
            // ),
            title: Text('${controller.stockInfo.value.name.toUpperCase()}'),
            centerTitle: true,
          ),
          body: Center(
            child: Container(
                padding: EdgeInsets.all(30),
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
                          leading: Image(
                              image: NetworkImage(
                            '${controller.stockInfo.value.img}',
                          )),
                          title: Text(
                            '${controller.stockInfo.value.name.toUpperCase()}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          RichText(
                                text: textFormat_BoldNormal(),
                              ),
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
                    // ignore: unnecessary_null_comparison
                    Divider(),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black87,
                            width: .2,
                            style: BorderStyle.solid),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              'Descryption',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          controller.stockInfoMore.value.descryption != null
                              ? Html(
                                  data: controller
                                      .stockInfoMore.value.descryption)
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(),
                                  ],
                                ),
                        ],
                      ),
                    ),

                    // Text('${controller.stockInfoMore.value.descryption}')
                  ],
                )),
          ),
        ));
  }

  TextSpan textFormat_BoldNormal() {
    return TextSpan(
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
        ]);
  }
}
