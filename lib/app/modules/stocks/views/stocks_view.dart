import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/data/models/stocks_model.dart';
import 'package:getx_stocks_pse/app/routes/app_pages.dart';
import 'package:intl/intl.dart';

import '../controllers/stocks_controller.dart';

class StocksView extends GetView<StocksController> {
  TextEditingController titleController = TextEditingController();
  // Stock _stockService = StockService

  // StocksController controller = Get.put(StocksController());

  // Widget build(BuildContext context) {
  //   return Obx(() => Scaffold(
  //       appBar: AppBar(
  //         title: Text(controller.isLoading.value.toString()),
  //       ),
  //       body: controller.isLoading.value
  //           ? CircularProgressIndicator()
  //           : GetBuilder<StocksController>(
  //               builder: (controller) => ListView.builder(
  //                   itemCount: controller.stockList.length,
  //                   itemBuilder: (context, index) {
  //                     return ListTile(
  //                       title: Column(
  //                         children: [
  //                           Text(
  //                               'Number: ${controller.stockList[index].companyName}'),
  //                           ElevatedButton(
  //                             onPressed: () {
  //                               controller.stockList[index].companyName =
  //                                   "changed";
  //                               controller.update();
  //                             },
  //                             child: Text('fdf'),
  //                           )
  //                         ],
  //                       ),
  //                     );
  //                   }))));
  // }
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
                            ),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'lib/app/data/assets/stocks_header_image.jpg'),
                              // image: NetworkImage(
                              //     "https://content.fortune.com/wp-content/uploads/2019/10/GettyImages-1158402857.jpg"),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.white,
                            // border: BoxBorder(),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0),
                                topRight: Radius.circular(0),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    controller.isLoading.value
                        ? CircularProgressIndicator()
                        : Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(.5),
                                      blurRadius: 20.0, // soften the shadow
                                      spreadRadius: 0.0, //extend the shadow
                                      offset: Offset(
                                        5.0, // Move to right 10  horizontally
                                        5.0, // Move to bottom 10 Vertically
                                      ),
                                    )
                                  ],
                                ),
                                child: Card(
                                    // shadowColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20),
                                        child: Scrollbar(
                                            isAlwaysShown: true,
                                            // child:GetBuilder< StocksController>(builder: (controller)=>
                                            //    showStocks())));
                                            // }
                                            child: GetBuilder<StocksController>(
                                              builder:
                                                  (controller) =>
                                                      ListView.builder(
                                                          itemCount: controller
                                                              .stockListFiltered
                                                              .length,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Column(
                                                              children: [
                                                                ListTile(
                                                                  visualDensity:
                                                                      VisualDensity(
                                                                          vertical:
                                                                              -4),

                                                                  leading: Text(
                                                                    '${controller.stockListFiltered[index].tickerSymbol}',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        color: Colors
                                                                            .amber[800]),
                                                                  ),
                                                                  title: Text(
                                                                      '${controller.stockListFiltered[index].companyName}'),
                                                                  subtitle:
                                                                      Text(
                                                                    '${controller.stockListFiltered[index].status}',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .blue[100]),
                                                                  ),
                                                                  trailing:
                                                                      Icon(
                                                                    Icons
                                                                        .addchart,
                                                                    color: Colors
                                                                        .amber,
                                                                  ),
                                                                  // trailing: Text('${controller.stockList[index].status}'),
                                                                  onTap: () {
                                                                    // Get.toNamed(
                                                                    //     '${Routes.STOCK}',
                                                                    //     arguments: {
                                                                    //       'tickerSymbol': controller
                                                                    //           .stockList[
                                                                    //               index]
                                                                    //           .tickerSymbol
                                                                    //     });

                                                                    controller
                                                                        .stockListFiltered[
                                                                            index]
                                                                        .companyName = "3434";

                                                                    controller
                                                                        .update();
                                                                    print(controller
                                                                        .stockListFiltered[
                                                                            index]
                                                                        .companyName
                                                                        .toString());
                                                                  },
                                                                ),
                                                                Divider(),
                                                              ],
                                                            );
                                                          }),
                                            )))),
                              ),
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
