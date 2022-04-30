import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/core/utils/helpers.dart';
import 'package:getx_stocks_pse/app/data/models/chart_data.dart';
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
                              title: ChartTitle(
                                  text:
                                      '${controller.cryptoDetails.value.name.toString()} Histogram'),
                              margin: EdgeInsets.all(10),
                              tooltipBehavior: controller.tooltipBehavior,
                              zoomPanBehavior: controller.zoomPanBehavior.value,
                              // Initialize category axis
                              primaryXAxis: CategoryAxis(),
                              series: <ChartSeries>[
                                // Initialize line series
                                LineSeries<ChartData, String>(
                                  width: .8,
                                  animationDuration: 4000,
                                  dataSource: controller.cryptoHistoryList,
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y,
                                  trendlines: <Trendline>[
                                    Trendline(
                                        type: TrendlineType.exponential,
                                        opacity: .3,
                                        width: .8,
                                        color: Colors.amber.shade500)
                                  ],
                                ),
                              ]),
                        ),
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
                                  Row(
                                    children: [
                                      Text(
                                        '${Helpers().selectedCurrency()} ${Helpers().moneyFormatter(controller.cryptoDetails.value.marketData!.currentPrice.toString())} ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Helpers().percent24ChangeChecker(
                                          controller
                                              .cryptoDetails
                                              .value
                                              .marketData!
                                              .high24ChangePercentage,
                                          35.sp)
                                    ],
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'High 24:  '.toUpperCase(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.sp),
                                      ),
                                      Text(
                                        '${Helpers().selectedCurrency()} ${Helpers().moneyFormatter(controller.cryptoDetails.value.marketData!.high24)}  ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 30.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Low 24:  '.toUpperCase(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.sp),
                                      ),
                                      Text(
                                        '${Helpers().selectedCurrency()} ${Helpers().moneyFormatter(controller.cryptoDetails.value.marketData!.low24.toString())}  ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 30.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Volume:  '.toUpperCase(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.sp),
                                      ),
                                      Text(
                                        '${Helpers().selectedCurrency()} ${Helpers().moneyFormatter(controller.cryptoDetails.value.marketData!.totalVolume.toString())}  ',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 30.sp),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Market Cap:  '.toUpperCase(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30.sp),
                                      ),
                                      Text(
                                        '${Helpers().selectedCurrency()} ${Helpers().moneyFormatter(controller.cryptoDetails.value.marketData!.marketCap)}',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(fontSize: 30.sp),
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
