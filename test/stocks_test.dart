import 'package:flutter_test/flutter_test.dart';

import 'package:cryptos/app/modules/stocks/controllers/stocks_controller.dart';

// import 'package:';

void main() {
  test("Loading must be true at screen init", () async {
    final test_controller = await StocksController();
    test_controller.isLoading;
    expect(test_controller.isLoading.value, true);
  });
}
