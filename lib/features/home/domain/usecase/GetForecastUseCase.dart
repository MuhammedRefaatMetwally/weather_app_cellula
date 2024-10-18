import '../../data/models/fetch_forecast_response.dart';
import '../ForecastRepository.dart';
import '../entity/Forecast.dart';

class GetForecastUseCase {
  final ForecastRepository forecastRepository;

  GetForecastUseCase(this.forecastRepository);

  Future<FetchForecastEntity> call(String city) async {
    return await forecastRepository.getForecast(city);
  }
}