import '../../data/models/fetch_forecast_response.dart';
import '../../domain/entity/Forecast.dart';

abstract class ForecastState {}

class ForecastInitial extends ForecastState {}

class ForecastLoading extends ForecastState {}

class ForecastLoaded extends ForecastState {
  FetchForecastEntity forecast;

  ForecastLoaded(this.forecast);
}

class ForecastError extends ForecastState {
  final String message;

  ForecastError(this.message);
}