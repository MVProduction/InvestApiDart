/// Описание позиции валюты в портфеле
class TinkoffPortfolioCurrencyPosition {
  final String currency;
  final num balance;
  final num blocked;

  /// Создаёт из json
  static TinkoffPortfolioCurrencyPosition fromJson(Map<String, dynamic> data) {
    return TinkoffPortfolioCurrencyPosition(
        data['currency'], data['balance'], data['blocked']);
  }

  /// Конструктор
  TinkoffPortfolioCurrencyPosition(this.currency, this.balance, this.blocked);

  /// Переводит в строку
  @override
  String toString() {
    return 'currency: $currency balance: $balance $blocked';
  }
}
