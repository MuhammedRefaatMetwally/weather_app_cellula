abstract class ForecastEvent {}

class FetchForecastEvent extends ForecastEvent {
  final String city;

  FetchForecastEvent(this.city);
}
