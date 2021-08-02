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
          return Scrollbar(
            child: ListView.builder(
                itemCount: controller.stockList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: ListTile(
                      title: Text(
                        '${controller.stockList[index].tickerSymbol}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                          Text('${controller.stockList[index].companyName}'),
                      trailing: Text('${controller.stockList[index].status}'),
                      onTap: () {
                        Get.toNamed('${Routes.STOCK}', arguments: {
                          'tickerSymbol':
                              controller.stockList[index].tickerSymbol
                        });
                      },
                    ),
                  );
                }),
          );
        }),
      ),
    );
  }
}
