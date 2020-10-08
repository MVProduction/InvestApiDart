/// Значение с указанием типа валюты
class ValueWithCurrency {
  /// Тип валюты
  final String currency;

  /// Значение
  final num value;

  /// Создаёт из json
  static ValueWithCurrency fromJson(Map<String, dynamic> data) {
    if (data == null) return null;
    return ValueWithCurrency(data['currency'], data['value']);
  }

  /// Конструктор
  ValueWithCurrency(this.currency, this.value);

  /// Переводит в строку
  @override
  String toString() {
    return 'currency: $currency value: $value';
  }
}
