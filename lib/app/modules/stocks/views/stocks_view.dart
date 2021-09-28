import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/data/assets/styles/text_styles.dart';
import 'package:getx_stocks_pse/app/data/models/stocks_model.dart';
import 'package:getx_stocks_pse/app/routes/app_pages.dart';

import '../controllers/stocks_controller.dart';
import 'package:intl/intl.dart' as intl;

class StocksView extends GetView<StocksController> {
  final decimalFormatter = intl.NumberFormat.decimalPattern();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRYPTOS'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          return Container(
            child: controller.isLoading.value
                ? CircularProgressIndicator()
                : Scrollbar(
                    child: ListView.builder(
                        itemCount: controller.stockList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: ListTile(
                              onTap: () {
                                // print(controller.stockList[index].tickerSymbol);
                                // Get.toNamed(Routes.STOCK, parameters:controller.stockList[index] );
                                Get.toNamed(Routes.STOCK,
                                    parameters:
                                        toMap(controller.stockList[index]));
                              },
                              leading: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                    '${controller.stockList[index].img}'),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText.rich(
                                    TextSpan(children: [
                                      TextSpan(
                                        text:
                                            '${controller.stockList[index].tickerSymbol}'
                                                .toUpperCase(),
                                        style: TextStyle(
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextSpan(
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black,
                                          ),
                                          text:
                                              '- ${controller.stockList[index].companyName}'
                                                  .toUpperCase()),
                                    ]),
                                    minFontSize: 4,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Market Cap:  ${intl.NumberFormat.decimalPattern().format(double.parse(controller.stockList[index].marketCap.toString()))}',
                                    style: TextStyles().myStyleSubtitle(),
                                  ),
                                  Text(
                                    'Volume:  ${intl.NumberFormat.decimalPattern().format(double.parse(controller.stockList[index].totalVolume.toString()))}',
                                    style: TextStyles().myStyleSubtitle(),
                                  ),
                                ],
                              ),
                              trailing: Container(
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border(left: BorderSide(width: 1))),
                                child: SizedBox(
                                  width: 80,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RichText(
                                            text: TextSpan(
                                          children: [
                                            TextSpan(
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                color: Colors.black,
                                              ),
                                              text:
                                                  '${decimalFormatter.format(controller.stockList.value[index].price)}',
                                            ),
                                            TextSpan(text: ' '),
                                            TextSpan(
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10,
                                                  color: controller
                                                              .stockList
                                                              .value[index]
                                                              .priceChangePercentage24h!
                                                              .toDouble() >=
                                                          1
                                                      ? Colors.blue
                                                      : Colors.red,
                                                ),
                                                text:
                                                    '${controller.stockList.value[index].priceChangePercentage24h?.toStringAsFixed(2)}%'),
                                          ],
                                        )),
                                        Text(
                                          'High: \$${decimalFormatter.format(controller.stockList[index].high24h)}  ',
                                          style: TextStyles().myStyleSubtitle(),
                                        ),
                                        Text(
                                          'Low: \$${decimalFormatter.format(controller.stockList[index].low24h)} ',
                                          style: TextStyles().myStyleSubtitle(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
          );
        }),
      ),
    );
  }

  toMap(Stocks stocks) {
    var map = Map<String, String>();
    map['tickerSymbol'] = stocks.tickerSymbol.toString();
    map['companyName'] = stocks.companyName.toString();
    map['price'] = stocks.price.toString();
    map['high24h'] = stocks.high24h.toString();
    map['low24h'] = stocks.low24h.toString();
    map['priceChangePercentage24h'] =
        stocks.priceChangePercentage24h.toString();
    map['img'] = stocks.img.toString();
    map['marketCap'] = stocks.marketCap.toString();
    map['totalVolume'] = stocks.totalVolume.toString();
    return map;
  }
}
