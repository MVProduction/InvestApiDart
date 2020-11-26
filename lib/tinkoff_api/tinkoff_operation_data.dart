import 'package:invest_api_dart/common/value_with_currency.dart';

/// Описание операций пользователя
abstract class TinkoffOperationData {
  /// Идентификатор операции
  final String id;

  /// Дата операции
  final DateTime date;

  /// Конструктор
  TinkoffOperationData(this.id, this.date);
}

/// Описание операции выплаты дивидендов
class TinkoffDividendOperationData extends TinkoffOperationData {
  /// Код инструмента
  final String figi;

  /// Выплаты
  final ValueWithCurrency payment;

  /// Конструктор
  TinkoffDividendOperationData(
      String id, DateTime date, this.figi, this.payment)
      : super(id, date);

  /// Создаёт из json
  static TinkoffDividendOperationData fromJson(Map<String, dynamic> data) {
    return TinkoffDividendOperationData(
        data['id'],
        DateTime.parse(data['date']),
        data['figi'],
        ValueWithCurrency(data['currency'], data['payment']));
  }

  /// Переводит в строку
  @override
  String toString() {
    return 'DividendOperation id: $id date: $date figi: $figi payment: $payment';
  }
}
