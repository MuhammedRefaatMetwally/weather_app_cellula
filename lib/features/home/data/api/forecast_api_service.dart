import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/fetch_forecast_response.dart';

part 'forecast_api_service.g.dart';

@RestApi(baseUrl:"http://api.weatherapi.com/v1")
abstract class ForecastApiService {
  factory ForecastApiService(Dio dio, {String baseUrl}) = _ForecastApiService;

  @GET("/forecast.json")
  Future<FetchForecastResponse> fetchForecast({
    @Query('q') required String city,
    @Query('days') int days = 7,
    @Query('key') String apiKey = "f6f4a7bd87744a0da00122226241810",
    @CancelRequest() CancelToken? cancelToken,
  });
}
