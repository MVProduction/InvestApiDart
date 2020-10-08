import 'package:invest_api_dart/common/value_with_currency.dart';

/// Позиция в портфеле
class TinkoffPortfolioPosition {
  final String figi;
  final String ticker;
  final String isin;
  final String instrumentType;
  final num balance;
  final num blocked;
  final ValueWithCurrency expectedYield;
  final num lots;
  final ValueWithCurrency averagePositionPrice;
  final ValueWithCurrency averagePositionPriceNoNkd;
  final String name;

  /// Создаёт из json
  static TinkoffPortfolioPosition fromJson(Map<String, dynamic> data) {
    return TinkoffPortfolioPosition(
        data['figi'],
        data['ticker'],
        data['instrumentType'],
        data['balance'],
        ValueWithCurrency.fromJson(data['expectedYield']),
        data['lots'],
        ValueWithCurrency.fromJson(data['averagePositionPrice']),
        data['name'],
        isin: data['isin'],
        blocked: data['blocked'],
        averagePositionPriceNoNkd:
            ValueWithCurrency.fromJson(data['averagePositionPriceNoNkd']));
  }

  /// Конструктор
  TinkoffPortfolioPosition(
      this.figi,
      this.ticker,
      this.instrumentType,
      this.balance,
      this.expectedYield,
      this.lots,
      this.averagePositionPrice,
      this.name,
      {this.isin,
      this.blocked,
      this.averagePositionPriceNoNkd});

  /// Преобразует в строку
  @override
  String toString() {
    return 'name: $name figi: $figi ticker: $ticker isin: $isin instrumentType: $instrumentType balance: $balance blocked: $blocked expectedYield: $expectedYield lots: $lots averagePositionPrice: $averagePositionPrice averagePositionPriceNoNkd: $averagePositionPriceNoNkd';
  }
}
