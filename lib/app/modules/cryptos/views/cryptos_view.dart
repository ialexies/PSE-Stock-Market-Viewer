import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_stocks_pse/app/core/utils/helpers.dart';
import 'package:getx_stocks_pse/app/data/assets/styles/text_styles.dart';
import 'package:getx_stocks_pse/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/cryptos_controller.dart';
import 'package:intl/intl.dart' as intl;

class CryptosView extends GetView<CryptosController> {
  final decimalFormatter = intl.NumberFormat.decimalPattern();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return controller.shouldPop.value;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(447.h),
          child: Column(
            children: [
              AppBar(
                title: Text('CRYPTOS'),
                centerTitle: true,
                actions: [
                  Obx(() => Container(
                        margin: EdgeInsets.all(20.w),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: .5),
                            borderRadius: BorderRadius.circular(30.r),
                            color: Colors.blue[600],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset:
                                    Offset(3, 3), // changes position of shadow
                              ),
                              BoxShadow(
                                color: Colors.white.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(
                                    -2, -2), // changes position of shadow
                              ),
                            ]),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            borderRadius: BorderRadius.circular(10.r),
                            // isExpanded: true,
                            // itemHeight: 50,
                            // menuMaxHeight: 300,
                            isDense: true,

                            value: controller.currencySelected.value,
                            icon: const Icon(Icons.arrow_downward),
                            iconSize: 18,
                            elevation: 16,
                            style: const TextStyle(color: Colors.white),
                            iconDisabledColor: Colors.white,
                            // hint: Text('Select Item'),
                            dropdownColor: Colors.blue[600],
                            iconEnabledColor: Colors.yellow,
                            // underline: SizedBox(
                            //     // height: 2,
                            //     // color: Colors.deepPurpleAccent,
                            //     ),
                            onChanged: (String? newValue) {
                              controller.isLoading(true);
                              controller.updateCurrencySelected(newValue!);
                            },
                            // items:
                            items: controller.currencies
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value,
                                  child: SizedBox(
                                    child: Text(
                                      value.toUpperCase(),
                                      // style: TextStyle(color: Colors.red),
                                    ),
                                  ));
                            }).toList(),
                          ),
                        ),
                      )),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(71, 0, 0, 0),
                      blurRadius: 8,
                      offset: Offset(0, 8), // Shadow position
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey.shade800,
                      Colors.grey.shade600,
                    ],
                  ),
                ),
                padding: EdgeInsets.fromLTRB(30.h, 50.h, 30.h, 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150.h,
                      child: TextField(
                        autofocus: false,
                        controller: controller.searchTextController.value,
                        onChanged: (value) => controller.updateSearch(value),
                        onSubmitted: (value) => controller.searchCryptos(value),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            suffixIcon: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () => controller.clearSearch()),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'Search Here..',
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            labelStyle: TextStyle(color: Colors.amber),
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(5.0)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2.0),
                                borderRadius: BorderRadius.circular(5.0)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        '${controller.cryptoListFiltered.length.toString()} Found',
                        style: TextStyle(fontSize: 30.sp, color: Colors.white),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Obx(
            () => Container(
              child: controller.isLoading.value
                  ? CircularProgressIndicator()
                  : Scrollbar(
                      child: ListView.builder(
                          itemCount: controller.cryptoListFiltered.length,
                          itemBuilder: (context, index) {
                            var filteredData = controller.cryptoListFiltered;

                            return Container(
                              padding: EdgeInsets.only(top: 10.h),
                              child: ListTile(
                                onTap: () {
                                  var stockData = filteredData[index].toJson();
                                  Get.toNamed(Routes.CRYPTO,
                                      arguments: stockData["id"]
                                          .toString()
                                          .toLowerCase());
                                },
                                leading: Padding(
                                  padding: const EdgeInsets.all(.0),
                                  child: Image.network(
                                      '${filteredData[index].img}',
                                      width: 130.w),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText.rich(
                                      TextSpan(children: [
                                        TextSpan(
                                          text:
                                              '${filteredData[index].tickerSymbol}'
                                                  .toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40.sp,
                                          ),
                                        ),
                                        TextSpan(
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.black,
                                              fontSize: 40.sp,
                                            ),
                                            text:
                                                '-${filteredData[index].companyName}'
                                                    .toUpperCase()),
                                      ]),
                                      minFontSize: 4,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      'Market Cap:  ${Helpers().moneyFormatter(filteredData[index].marketCap)}',
                                      style: TextStyles().myStyleSubtitle(),
                                    ),
                                    Text(
                                      'Volume:  ${Helpers().moneyFormatter(filteredData[index].totalVolume)}',
                                      style: TextStyles().myStyleSubtitle(),
                                    ),
                                  ],
                                ),
                                trailing: Column(
                                  children: [
                                    Container(
                                      // height: double.infinity,
                                      padding: EdgeInsets.only(top: 25.h),
                                      // height: 300,
                                      width: 260.w,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              left: BorderSide(width: 1))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '${Helpers().moneyFormatter(filteredData[index].price.toString())}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30.sp,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  controller
                                                      .currencySelected.value
                                                      .toUpperCase(),
                                                  style: GoogleFonts.oswald(
                                                      fontSize: 24.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.blueGrey),
                                                ),
                                              ],
                                            ),

                                            Helpers().percent24ChangeChecker(
                                                controller
                                                    .cryptoListFiltered[index]
                                                    .priceChangePercentage24h,
                                                25.sp),

                                            // RichText(
                                            //     text: TextSpan(
                                            //   children: [
                                            //     TextSpan(
                                            //       style: TextStyle(
                                            //         fontWeight: FontWeight.bold,
                                            //         fontSize: 35.sp,
                                            //         color: Colors.black,
                                            //       ),
                                            //       text:
                                            //           // '${controller.currencySelectedSymbol.value}${decimalFormatter.format(filteredData[index].price)}',
                                            //           '${controller.currencySelectedSymbol.value}${decimalFormatter.format(filteredData[index].price)}',
                                            //       // '${controller.currencySelectedSymbol.value}${double.parse(filteredData[index].price?.toStringAsFixed() ?? "0")}',
                                            //     ),
                                            //     TextSpan(text: ' '),
                                            //     TextSpan(
                                            //         style: TextStyle(
                                            //           fontWeight: FontWeight.w500,
                                            //           fontSize: 30.sp,
                                            //           color: controller
                                            //                       .cryptoList
                                            //                       .value[index]
                                            //                       .priceChangePercentage24h!
                                            //                       .toDouble() >=
                                            //                   1
                                            //               ? Colors.blue
                                            //               : Colors.red,
                                            //         ),
                                            //         text:
                                            //             '${filteredData[index].priceChangePercentage24h?.toStringAsFixed(2)}%'),
                                            //   ],
                                            // )),
                                            Text(
                                              'High: ${controller.currencySelectedSymbol.value}${decimalFormatter.format(filteredData[index].high24h)}  ',
                                              style: TextStyles()
                                                  .myStyleSubtitle()
                                                  .copyWith(
                                                    fontSize: 25.sp,
                                                  ),
                                            ),
                                            Text(
                                              'Low: ${controller.currencySelectedSymbol.value}${decimalFormatter.format(filteredData[index].low24h)} ',
                                              style: TextStyles()
                                                  .myStyleSubtitle()
                                                  .copyWith(
                                                    fontSize: 25.sp,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
