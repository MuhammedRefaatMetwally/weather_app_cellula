
import '../../data/models/fetch_forecast_response.dart';

class FetchForecastEntity {
  final String city, country;
  final Current current;
  final Forecast forecast;

  FetchForecastEntity({
    required this.country,
    required this.city,
    required this.forecast,
    required this.current,
  });
}
