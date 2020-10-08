/// Доступные интервалы свечи
enum TinkoffCandleInterval {
  Min1,
  Min2,
  Min3,
  Min5,
  Min10,
  Min15,
  Min30,
  Hour,
  Day,
  Week,
  Month
}

extension TinkoffCandleIntervalStringHelper on String {
  TinkoffCandleInterval toTinkoffCandleInterval() {
    switch (this) {
      case 'min1':
        return TinkoffCandleInterval.Min1;
      case 'min2':
        return TinkoffCandleInterval.Min2;
      case 'min3':
        return TinkoffCandleInterval.Min3;
      case 'min5':
        return TinkoffCandleInterval.Min5;
      case 'min10':
        return TinkoffCandleInterval.Min10;
      case 'min15':
        return TinkoffCandleInterval.Min15;
      case 'min30':
        return TinkoffCandleInterval.Min30;
      case 'hour':
        return TinkoffCandleInterval.Hour;
      case 'day':
        return TinkoffCandleInterval.Day;
      case 'month':
        return TinkoffCandleInterval.Month;
    }

    return null;
  }
}

extension TinkoffCandleIntervalHelper on TinkoffCandleInterval {
  /// Возвращает строковое значение
  String getStringValue() {
    switch (this) {
      case TinkoffCandleInterval.Min1:
        return 'min1';
      case TinkoffCandleInterval.Min2:
        return 'min2';
      case TinkoffCandleInterval.Min3:
        return 'min3';
      case TinkoffCandleInterval.Min5:
        return 'min5';
      case TinkoffCandleInterval.Min10:
        return 'min10';
      case TinkoffCandleInterval.Min15:
        return 'min15';
      case TinkoffCandleInterval.Min30:
        return 'min30';
      case TinkoffCandleInterval.Hour:
        return 'hour';
      case TinkoffCandleInterval.Day:
        return 'day';
      case TinkoffCandleInterval.Week:
        return 'week';
      case TinkoffCandleInterval.Month:
        return 'month';
    }

    return null;
  }
}
