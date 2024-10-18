
import '../../domain/entity/Forecast.dart';
import '../models/fetch_forecast_response.dart';

class ForecastMapper {
  ForecastMapper._();

  static FetchForecastEntity toForecastEntity(
    FetchForecastResponse forecastResponse,
  ) {
    return FetchForecastEntity(
      city: forecastResponse.location.name!,
      country: forecastResponse.location.country!,
      current: forecastResponse.current,
      forecast: forecastResponse.forecast,
    );
  }
}
