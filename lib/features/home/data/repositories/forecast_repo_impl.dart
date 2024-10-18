import '../../domain/ForecastRepository.dart';
import '../../domain/entity/Forecast.dart';
import '../api/forecast_api_service.dart';
import '../api/forecast_mapper.dart';
import '../models/fetch_forecast_response.dart';


class ForecastRepositoryImpl implements ForecastRepository {
  final ForecastApiService apiService;

  ForecastRepositoryImpl(this.apiService);

  @override
  Future<FetchForecastEntity> getForecast(String city) async {
    try {
      final forecast = await apiService.fetchForecast(
        city: city,
      );

      final forecastEntity = ForecastMapper.toForecastEntity(forecast);
      return forecastEntity;
    } catch (e) {
      throw Exception("Failed to fetch forecast: $e");
    }
  }
}
