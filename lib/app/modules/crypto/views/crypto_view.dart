import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/core/utils/helpers.dart';
import 'package:getx_stocks_pse/app/data/models/crypto_history.dart';
import 'package:getx_stocks_pse/app/data/models/crypto_model.dart';
// import 'package:getx_stocks_pse/app/data/models/stock_history.dart';
// import 'package:getx_stocks_pse/app/data/models/crypto_mode.dart';

// import 'package:getx_stocks_pse/app/data/models/stock_history.dart';
import 'package:getx_stocks_pse/app/modules/crypto/controllers/crypto_controller.dart';
// import 'package:getx_stocks_pse/app/data/models/stock_model.dart';

import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              future: controller.getCryptoInfo(Get.arguments),
              builder: (context, snapshot) {
                var data = snapshot.data;
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
                            tileColor: Colors.amber.withOpacity(.1),
                            contentPadding: EdgeInsets.all(10),
                            leading: Image.network(
                                '${data!.img!.large.toString()}',
                                width: 150.w),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${data.symbol.toString().toUpperCase()} - ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${data.name.toString()}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${Helpers().selectedCurrency()} ${Helpers().moneyFormatter(data.marketData!.currentPrice.toString())} ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Market Cap:  '.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                    Text(
                                      '${Helpers().selectedCurrency()} ${Helpers().moneyFormatter(data.marketData!.marketCap)}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'High 24:  '.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                    Text(
                                      '${Helpers().selectedCurrency()} ${Helpers().moneyFormatter(data.marketData!.high24)}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Low 24:  '.toUpperCase(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10),
                                    ),
                                    Text(
                                      '${Helpers().selectedCurrency()} ${Helpers().moneyFormatter(data.marketData!.low24.toString())}',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.all(15),
                              child: Text('${data.description}'))
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
