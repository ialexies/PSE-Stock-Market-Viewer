import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/data/models/stocks_model.dart';
import 'package:getx_stocks_pse/app/routes/app_pages.dart';
import 'package:intl/intl.dart';

import '../controllers/stocks_controller.dart';

class StocksView extends GetView<StocksController> {
  TextEditingController titleController = TextEditingController();
  // Stock _stockService = StockService
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          // appBar: AppBar(
          //   title: Text('StocksView'),
          //   centerTitle: true,
          // ),
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.graphic_eq_sharp), label: 'Market'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'News'),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.search_rounded),
              onPressed: () {
                Get.defaultDialog(
                    onConfirm: () {
                      print(titleController.text);
                      controller.searchFilter(titleController.text);
                      // Navigator.of(context).pop();
                    },
                    title: 'Custom Search',
                    content: Column(
                      children: [
                        //   DropdownButton<String>(items: <String>[
                        //     'one','two'
                        //   ].map().toList());

                        // .map<DropdownMenuItem<String>>((String value) =>{ return DropdownMenuItem<String>(value: value, child: Text('fdf'),);}).toList());}

                        // Obx(() => DropdownButton(
                        //     value: controller.searchType.value,
                        //     icon: const Icon(Icons.arrow_downward),
                        //     iconSize: 24,
                        //     elevation: 16,
                        //     style: const TextStyle(color: Colors.deepPurple),
                        //     underline: Container(
                        //       height: 2,
                        //       color: Colors.deepPurpleAccent,
                        //     ),
                        //     onChanged: (String? newValue) {
                        //       controller.searchType.value = newValue!;
                        //       controller.update();
                        //       print(controller.searchType.value);
                        //     },
                        //     items: <String>['Company Name', 'Stock Code']
                        //         .map<DropdownMenuItem<String>>((String value) {
                        //       return DropdownMenuItem(
                        //           value: value, child: Text(value));
                        //     }).toList())),

                        TextField(
                          controller: titleController,
                          onChanged: (value) {
                            debugPrint('Something changed in Title Text Field');
                          },
                          decoration: InputDecoration(
                              labelText: 'Title',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                        ),
                      ],
                    ));
                titleController.text = "";
              }),
          body: SafeArea(
              top: false,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight, end: Alignment.bottomRight,
                      // colors: [Colors.purple, Colors.blue]),
                      colors: [Colors.white10, Colors.white54]),
                ),
                child: Column(
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 160,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Card(
                              color: Colors.white.withOpacity(.9),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  // mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            'PSE',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 40),
                                          ),
                                          Flexible(
                                            child: Text(
                                              'Philippine Stock Exchange',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w100,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Text(
                                            'Date: ${DateFormat('yyyy-MM-dd').format(DateTime.now())}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                          ),
                  ],
                ),
              )),
        ));
  }

  // ListView showStocks() {
  //   return ListView.builder(
  //       itemCount: controller.stockList.length,
  //       itemBuilder: (context, index) {
  //         return Column(
  //           children: [
  //             ListTile(
  //               visualDensity: VisualDensity(vertical: -4),
  //               // contentPadding: EdgeInsets.zero,
  //               // leading: Text('fdf'),
  //               leading: Text(
  //                 '${controller.stockList[index].tickerSymbol}',
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.bold, color: Colors.amber[800]),
  //               ),
  //               title: Text('${controller.stockList[index].companyName}'),
  //               subtitle: Text(
  //                 '${controller.stockList[index].status}',
  //                 style: TextStyle(color: Colors.blue[100]),
  //               ),
  //               trailing: Icon(
  //                 Icons.addchart,
  //                 color: Colors.amber,
  //               ),
  //               // trailing: Text('${controller.stockList[index].status}'),
  //               onTap: () {
  //                 // Get.toNamed('${Routes.STOCK}', arguments: {
  //                 //   'tickerSymbol': controller.stockList[index].tickerSymbol
  //                 // });

  //                 controller.stockList[index].companyName = "3434";

  //                 controller.update();
  //                 print(controller.stockList[index].companyName.toString());
  //               },
  //             ),
  //             Divider(),
  //           ],
  //         );
  //       });
  // }
}
