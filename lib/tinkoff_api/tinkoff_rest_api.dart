import 'package:dio/dio.dart';
import 'package:invest_api_dart/tinkoff_api/tinkoff_api_constants.dart';
import 'package:invest_api_dart/tinkoff_api/tinkoff_candle_data.dart';
import 'package:invest_api_dart/tinkoff_api/tinkoff_candle_interval.dart';
import 'package:invest_api_dart/tinkoff_api/tinkoff_portfolio_currency_position.dart';

import 'tinkoff_portfolio_position.dart';

/// Для работы с Tinkoff Rest API
class TinkoffRestApi {
  /// Токен доступа к API
  final String _token;

  /// Конструктор
  TinkoffRestApi(this._token);

  /// Делает GET запрос к API
  Future<Response> _getRequest(String path, {Map<String, dynamic> params}) {
    final resPath = '${COMMON_URL}${path}';
    final dio = Dio();
    //dio.interceptors.add(LogInterceptor(requestBody: true));
    return dio.get(resPath,
        queryParameters: params,
        options: Options(
            contentType: 'application/json',
            headers: {'Authorization': 'Bearer $_token'}));
  }

  /// Возвращает позиции по портфелю
  Future<List<TinkoffPortfolioPosition>> getPortfolio() async {
    final response = await _getRequest('/portfolio');
    final positions = response.data['payload']['positions'] as List<dynamic>;
    final res = <TinkoffPortfolioPosition>[];
    for (final position in positions) {
      res.add(TinkoffPortfolioPosition.fromJson(position));
    }
    return res;
  }

  /// Возвращает валютные позиции по портфелю
  Future<List<TinkoffPortfolioCurrencyPosition>>
      getPortfolioCurrencies() async {
    final response = await _getRequest('/portfolio/currencies');
    final positions = response.data['payload']['currencies'] as List<dynamic>;

    final res = <TinkoffPortfolioCurrencyPosition>[];
    for (final position in positions) {
      res.add(TinkoffPortfolioCurrencyPosition.fromJson(position));
    }
    return res;
  }

  /// Возвращает значения свечей инструмента
  Future<List<TinkoffCandleData>> getMarketCandles(String figi, DateTime from,
      DateTime to, TinkoffCandleInterval interval) async {
    final fromIso = from.toUtc().toIso8601String();
    final toIso = to.toUtc().toIso8601String();

    final response = await _getRequest('/market/candles', params: {
      'figi': figi,
      'from': fromIso,
      'to': toIso,
      'interval': interval.getStringValue()
    });

    final candles = response.data['payload']['candles'] as List<dynamic>;
    final res = <TinkoffCandleData>[];
    for (final candle in candles) {
      res.add(TinkoffCandleData.fromJson(candle));
    }
    return res;
  }
}
