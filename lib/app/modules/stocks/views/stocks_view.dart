import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/data/models/stocks_model.dart';
import 'package:getx_stocks_pse/app/routes/app_pages.dart';

import '../controllers/stocks_controller.dart';

class StocksView extends GetView<StocksController> {
  // Stock _stockService = StockService
  final formatCurrency = new NumberFormat.simpleCurrency();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StocksView'),
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
                              leading: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                    '${controller.stockList[index].img}'),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.stockList[index].companyName} (${controller.stockList[index].tickerSymbol})',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Market Cap: ${controller.stockList[index].marketCap}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                  ),
                                  Text(
                                    'High: ${formatCurrency.format(double.parse(controller.stockList[index].high24h.toString()))}   |  Low: ${formatCurrency.format(double.parse(controller.stockList[index].low24h.toString()))}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10),
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Volume: ${controller.stockList[index].tickerSymbol}',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                  Text(
                                    'Supply: ${controller.stockList[index].totalSupply}',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                              trailing: Text(
                                  '\$ ${controller.stockList[index].price}'),
                              // trailing:
                              //     Text('${controller.stockList[index].status}'),
                              onTap: () {
                                Get.toNamed('${Routes.STOCK}', arguments: {
                                  'tickerSymbol':
                                      controller.stockList[index].tickerSymbol
                                });
                              },
                            ),
                          );
                        }),
                  ),
          );
        }),
      ),
    );
  }
}
