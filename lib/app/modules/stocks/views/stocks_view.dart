import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:cryptos/app/data/assets/styles/text_styles.dart';
import 'package:cryptos/app/data/models/stocks_model.dart';
import 'package:cryptos/app/routes/app_pages.dart';

import '../controllers/stocks_controller.dart';
import 'package:intl/intl.dart' as intl;

class StocksView extends GetView<StocksController> {
  final decimalFormatter = intl.NumberFormat.decimalPattern();
  TextEditingController searchTextController = TextEditingController();
  // List<String> currencies = ['USD', 'PHP'];

  @override
  Widget build(BuildContext context) {
    // String dropdownValue = currencies[0];
    return Scaffold(
      appBar: AppBar(
        title: Text('CRYPTOS'),
        centerTitle: true,
        actions: [
          Obx(() => Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: .5),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[600],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(3, 3), // changes position of shadow
                      ),
                      BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(-2, -2), // changes position of shadow
                      ),
                    ]),
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  value: controller.currencySelected.value,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 18,
                  elevation: 16,
                  style: const TextStyle(color: Colors.white),
                  iconDisabledColor: Colors.green,
                  // hint: Text('Select Item'),
                  dropdownColor: Colors.blue[600],
                  iconEnabledColor: Colors.yellow,
                  underline: SizedBox(
                      // height: 2,
                      // color: Colors.deepPurpleAccent,
                      ),
                  onChanged: (String? newValue) {
                    controller.isLoading(true);
                    controller.updateCurrencySelected(newValue!);
                  },
                  // items:
                  items: controller.currencies
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value.toUpperCase(),
                        child: Text(
                          value,
                          // style: TextStyle(color: Colors.red),
                        ));
                  }).toList(),
                ),
              )),
        ],
      ),
      body: Center(
        child: Obx(
          () => Container(
            child: controller.isLoading.value
                ? CircularProgressIndicator()
                : Scrollbar(
                    child: ListView.builder(
                        itemCount: controller.stockListFiltered.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: ListTile(
                              // isThreeLine: true,
                              onTap: () {
                                print(controller.stockList[index].id);
                                Get.toNamed(Routes.STOCK,
                                    arguments: controller.stockList[index]);
                              },
                              leading: Padding(
                                padding: const EdgeInsets.all(.0),
                                child: Image.network(
                                  '${controller.stockListFiltered[index].img}',
                                  width: 50,
                                ),
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText.rich(
                                    TextSpan(children: [
                                      TextSpan(
                                        text:
                                            '${controller.stockListFiltered[index].symbol}'
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
                                              '- ${controller.stockListFiltered[index].name}'
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
                                    'Market Cap:  ${intl.NumberFormat.decimalPattern().format(double.parse(controller.stockListFiltered[index].marketCap.toString()))}',
                                    style: TextStyles().myStyleSubtitle(),
                                  ),
                                  Text(
                                    'Volume:  ${intl.NumberFormat.decimalPattern().format(double.parse(controller.stockListFiltered[index].totalVolume.toString()))}',
                                    style: TextStyles().myStyleSubtitle(),
                                  ),
                                ],
                              ),
                              trailing: Container(
                                // width: ,
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
                                              // text:
                                              //     '${controller.currencySelectedSymbol.value}${decimalFormatter.format(controller.stockListFiltered[index].price)}',
                                              text:
                                                  '${controller.currencySelectedSymbol.value} ${decimalFormatter.format(controller.stockListFiltered[index].price)}',
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
                                                    '${controller.stockListFiltered[index].priceChangePercentage24h?.toStringAsFixed(2)}%'),
                                          ],
                                        )),
                                        Text(
                                          'High: ${controller.currencySelectedSymbol.value}${decimalFormatter.format(controller.stockListFiltered[index].high24h)}  ',
                                          style: TextStyles()
                                              .myStyleSubtitle()
                                              .copyWith(fontSize: 9),
                                        ),
                                        Text(
                                          'Low: ${controller.currencySelectedSymbol.value}${decimalFormatter.format(controller.stockListFiltered[index].low24h)} ',
                                          style: TextStyles()
                                              .myStyleSubtitle()
                                              .copyWith(fontSize: 9),
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
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          Get.defaultDialog(
            contentPadding: EdgeInsets.all(20),
            titlePadding: EdgeInsets.all(20),
            onConfirm: () {
              controller.isSearch(true);
              controller.searchText(searchTextController.text);
              Get.back();
            },
            onCancel: () {
              controller.isSearch(false);
              controller.searchText("");
              Get.back();
            },
            textCancel: "Clear Search",
            textConfirm: "Search",
            title: "Search By Name",
            content: Column(
              children: [
                TextField(
                  controller: searchTextController,
                  onChanged: (value) {
                    debugPrint('Something changed in Title Text Field');
                  },
                  decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  toMap(Stocks stocks) {
    var map = Map<String, String>();
    map['tickerSymbol'] = stocks.symbol.toString();
    map['cryptoName'] = stocks.name.toString();
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
