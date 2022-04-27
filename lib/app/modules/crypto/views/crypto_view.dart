import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/data/models/crypto_history.dart';
import 'package:getx_stocks_pse/app/data/models/crypto_model.dart';
// import 'package:getx_stocks_pse/app/data/models/stock_history.dart';
// import 'package:getx_stocks_pse/app/data/models/crypto_mode.dart';

// import 'package:getx_stocks_pse/app/data/models/stock_history.dart';
import 'package:getx_stocks_pse/app/modules/crypto/controllers/crypto_controller.dart';
// import 'package:getx_stocks_pse/app/data/models/stock_model.dart';

import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// import '../controllers/stock_controller.dart';

class CryptoView extends GetView<CryptoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(Get.arguments["tickerSymbol"]),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: FutureBuilder<Crypto>(
              future: controller.getCryptoInfo(Get.parameters['tickerSymbol']),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {
                  return ListView(
                    children: [
                      SafeArea(
                          child: SfCartesianChart(
                              // legend: Legend(
                              //     isVisible: true,
                              //     position: LegendPosition.bottom),
                              zoomPanBehavior: controller.zoomPanBehavior.value,
                              // backgroundColor: Colors.amberAccent[50],
                              primaryXAxis: DateTimeAxis(),
                              enableAxisAnimation: true,
                              indicators: <
                                  TechnicalIndicators<CryptoHistory, DateTime>>[
                            RsiIndicator(
                              dataSource: controller.stockHistoryList,
                              xValueMapper: (CryptoHistory stockHistory, _) =>
                                  stockHistory.tradingDate,
                              closeValueMapper:
                                  (CryptoHistory stockHistory, _) =>
                                      stockHistory.close,
                              highValueMapper:
                                  (CryptoHistory stockHistory, _) =>
                                      stockHistory.high,
                              lowValueMapper: (CryptoHistory stockHistory, _) =>
                                  stockHistory.low,
                            ),
                            MacdIndicator(
                              signalLineWidth: .3,
                              macdLineWidth: .3,
                              longPeriod: 200,
                              shortPeriod: 7,
                              macdLineColor: Colors.red,
                              dataSource: controller.stockHistoryList,
                              xValueMapper: (CryptoHistory stockHistory, _) =>
                                  stockHistory.tradingDate,
                              closeValueMapper:
                                  (CryptoHistory stockHistory, _) =>
                                      stockHistory.close,
                            )
                          ],
                              series: <ChartSeries<CryptoHistory, DateTime>>[
                            // Renders line chart
                            LineSeries<CryptoHistory, DateTime>(
                                width: 100,
                                trendlines: <Trendline>[
                                  Trendline(
                                      width: .1,
                                      isVisible: true,
                                      name: "trend",
                                      color: Colors.yellow,
                                      opacity: .3)
                                ],
                                dataSource: controller.stockHistoryList,
                                xValueMapper: (CryptoHistory stockHistory, _) =>
                                    stockHistory.tradingDate,
                                yValueMapper: (CryptoHistory stockHistory, _) =>
                                    stockHistory.close)
                          ])),
                      Column(
                        children: [
                          Divider(),
                          ListTile(
                            leading: Column(
                              children: [
                                Text(
                                    '${snapshot.data?.tickerSymbol.toString()} ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30)),
                                // Text('(${snapshot.data?.price?["close"]})',
                                //     style: TextStyle(
                                //         fontWeight: FontWeight.bold,
                                //         fontSize: 15)),
                              ],
                            ),
                            title: Text(
                              '${snapshot.data?.companyName.toString()}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Open: Php ${snapshot.data?.price} Close: Php ${snapshot.data?.price}  ',
                                  textAlign: TextAlign.left,
                                ),
                                // Text(
                                //     'High: Php ${snapshot.data?.price?["high"]} Low: Php ${snapshot.data?.price?["low"]}  '),
                                // Text(
                                //     'Volume: ${snapshot.data?.price?["volume"]}'),
                                // Text(
                                //     'Timestamp: ${snapshot.data?.price?["timestamp"]}'),
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
                  );
                }
              }),
        ),
      ),
    );
  }
}
