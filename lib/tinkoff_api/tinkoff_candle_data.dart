import 'package:invest_api_dart/tinkoff_api/tinkoff_candle_interval.dart';

/// Информация о свече
class TinkoffCandleData {
  final String figi;
  final TinkoffCandleInterval interval;
  final num open;
  final num close;
  final num high;
  final num low;
  final num volume;
  final DateTime time;

  /// Создаёт из json
  static TinkoffCandleData fromJson(Map<String, dynamic> data) {
    return TinkoffCandleData(
        data['figi'],
        data['interval'].toString().toTinkoffCandleInterval(),
        data['o'],
        data['c'],
        data['h'],
        data['l'],
        data['v'],
        DateTime.parse(data['time']));
  }

  /// Конструктор
  TinkoffCandleData(this.figi, this.interval, this.open, this.close, this.high,
      this.low, this.volume, this.time);

  /// Преобразует в строку
  @override
  String toString() {
    return 'figi: $figi interval: ${interval.getStringValue()} open: $open close: $close high: $high low: $low volume: $volume $time';
  }
}
