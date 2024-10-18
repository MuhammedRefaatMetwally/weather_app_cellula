import 'entity/Forecast.dart';

abstract class ForecastRepository {
  Future<FetchForecastEntity> getForecast(String city);
}