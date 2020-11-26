/// Описание инструмента
class TinkoffInstrumentData {
  final String figi;
  final String ticker;
  final String isin;
  final num minPriceIncrement;
  final num lot;
  final num minQuantity;
  final String currency;
  final String name;

  TinkoffInstrumentData(
      {this.figi,
      this.ticker,
      this.isin,
      this.minPriceIncrement,
      this.lot,
      this.minQuantity,
      this.currency,
      this.name});

  /// Создаёт из json
  static TinkoffInstrumentData fromJson(Map<String, dynamic> data) {
    return TinkoffInstrumentData(
      figi: data['figi'],
      ticker: data['ticker'],
      isin: data['isin'],
      minPriceIncrement: data['minPriceIncrement'],
      lot: data['lot'],
      minQuantity: data['minQuantity'],
      currency: data['currency'],
      name: data['name'],
    );
  }

  /// Преобразует в строку
  @override
  String toString() {
    return 'TinkoffInstrumentData name: $name figi: $figi ticker: $ticker isin: $isin minPriceIncrement: $minPriceIncrement lot: $lot minQuantity: $minQuantity currency: $currency';
  }
}
