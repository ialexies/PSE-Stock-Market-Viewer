import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/data/models/stocks_model.dart';
import 'package:getx_stocks_pse/app/routes/app_pages.dart';

import '../controllers/stocks_controller.dart';
import 'package:intl/intl.dart' as intl;

class StocksView extends GetView<StocksController> {
  // final formatter = intl.NumberFormat.decimalPattern().format(1234);
  // Stock _stockService = StockService
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Currencies'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() {
          return Container(
            // width: double.infinity,
            child: controller.isLoading.value
                ? CircularProgressIndicator()
                : Scrollbar(
                    child: ListView.builder(
                        itemCount: controller.stockList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: ListTile(
                              onTap: () {
                                print(controller.stockList[index].tickerSymbol);
                              },
                              leading: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                    '${controller.stockList[index].img}'),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                          children: [
                                        TextSpan(
                                          text:
                                              '${controller.stockList[index].tickerSymbol}'
                                                  .toUpperCase(),
                                          style: TextStyle(
                                              color: Colors.grey[800],
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                            text:
                                                '- ${controller.stockList[index].companyName}'
                                                    .toUpperCase()),
                                      ])),
                                ],
                              ),
                              subtitle: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Market Cap:  ${intl.NumberFormat.decimalPattern().format(double.parse(controller.stockList[index].marketCap.toString()))}',
                                    style: myStyleSubtitle(),
                                  ),
                                  Text(
                                    'Volume:  ${intl.NumberFormat.decimalPattern().format(double.parse(controller.stockList[index].totalVolume.toString()))}',
                                    style: myStyleSubtitle(),
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
                                        Text(
                                          '\$${intl.NumberFormat.decimalPattern().format(double.parse(controller.stockList[index].price.toString()))}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          'High: \$${intl.NumberFormat.decimalPattern().format(double.parse(controller.stockList[index].high24h.toString()))}  ',
                                          style: myStyleSubtitle(),
                                        ),
                                        Text(
                                          'Low: \$${intl.NumberFormat.decimalPattern().format(double.parse(controller.stockList[index].low24h.toString()))} ',
                                          style: myStyleSubtitle(),
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

  TextStyle myStyleSubtitle() {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 10,
    );
  }
}
