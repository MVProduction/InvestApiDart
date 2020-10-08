import 'package:invest_api_dart/tinkoff_api/tinkoff_rest_api.dart';

import 'token.dart';

void main(List<String> arguments) async {
  final api = TinkoffRestApi(API_TOKEN);
  /*final positions = await api.getPortfolio();
  for (final pos in positions) {
    print(pos);
  }*/

  // final candles = await api.getMarketCandles('BBG00NNQMD85',
  //     DateTime(2020, 10, 1), DateTime(2020, 10, 8), TinkoffCandleInterval.Day);

  // for (final candle in candles) {
  //   print(candle);
  // }

  final currencies = await api.getPortfolioCurrencies();
  for (final currency in currencies) {
    print(currency);
  }
}
