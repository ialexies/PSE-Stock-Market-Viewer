import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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

import 'package:html/dom.dart' as dom;

class CryptoView extends GetView<CryptoController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          // title: Text(Get.arguments["tickerSymbol"]),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
              child: controller.isLoading.value
                  ? CircularProgressIndicator()
                  : ListView(
                      children: [
                        SafeArea(
                            child: SfCartesianChart(
                                // legend: Legend(
                                //     isVisible: true,
                                //     position: LegendPosition.bottom),
                                zoomPanBehavior:
                                    controller.zoomPanBehavior.value,
                                // backgroundColor: Colors.amberAccent[50],
                                primaryXAxis: DateTimeAxis(),
                                enableAxisAnimation: true,
                                indicators: <
                                    TechnicalIndicators<CryptoHistory,
                                        DateTime>>[
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
                                lowValueMapper:
                                    (CryptoHistory stockHistory, _) =>
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
                                  xValueMapper:
                                      (CryptoHistory stockHistory, _) =>
                                          stockHistory.tradingDate,
                                  yValueMapper:
                                      (CryptoHistory stockHistory, _) =>
                                          stockHistory.close)
                            ])),
                        Column(
                          children: [
                            Divider(),
                            ListTile(
                              tileColor: Colors.amber.withOpacity(.1),
                              contentPadding: EdgeInsets.all(10),
                              leading: Image.network(
                                  '${controller.cryptoDetails.value.img!.large.toString()}',
                                  width: 150.w),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        '${controller.cryptoDetails.value.symbol.toString().toUpperCase()} - ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '${controller.cryptoDetails.value.name.toString()}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blueGrey),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '${Helpers().selectedCurrency()} ${Helpers().moneyFormatter(controller.cryptoDetails.value.marketData!.currentPrice.toString())} ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                        '${Helpers().selectedCurrency()} ${Helpers().moneyFormatter(controller.cryptoDetails.value.marketData!.marketCap)}',
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
                                        '${Helpers().selectedCurrency()} ${Helpers().moneyFormatter(controller.cryptoDetails.value.marketData!.high24)}',
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
                                        '${Helpers().selectedCurrency()} ${Helpers().moneyFormatter(controller.cryptoDetails.value.marketData!.low24.toString())}',
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
                                child: Html(
                                    onLinkTap: (String? url,
                                        RenderContext context,
                                        Map<String, String> attributes,
                                        dom.Element? element) {
                                      final Uri thisurl =
                                          Uri.parse(url.toString());

                                      Helpers().urLauncher(thisurl);
                                      //open URL in webview, or launch URL in browser, or any other logic here
                                    },
                                    data: controller
                                        .cryptoDetails.value.description))
                          ],
                        ),
                      ],
                    )),
        ),
      ),
    );
  }
}
