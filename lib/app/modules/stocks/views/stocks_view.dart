import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/data/models/stocks_model.dart';
import 'package:getx_stocks_pse/app/routes/app_pages.dart';

import '../controllers/stocks_controller.dart';

class StocksView extends GetView<StocksController> {
  // Stock _stockService = StockService
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
                                    '${controller.stockList[index].companyName}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${controller.stockList[index].marketCap}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                  '${controller.stockList[index].tickerSymbol}'),
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
