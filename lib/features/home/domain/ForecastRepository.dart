import '../data/models/fetch_forecast_response.dart';
import 'entity/Forecast.dart';

abstract class ForecastRepository { sada
  Future<FetchForecastEntity> getForecast(String city);
}