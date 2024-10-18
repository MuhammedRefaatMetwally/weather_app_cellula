import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/GetForecastUseCase.dart';
import 'ForecastEvent.dart';
import 'ForecastState.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final GetForecastUseCase getForecastUseCase;

  ForecastBloc(this.getForecastUseCase) : super(ForecastInitial()) {
    on<FetchForecastEvent>(_onFetchForecastEvent);
  }

  Future<void> _onFetchForecastEvent(
    FetchForecastEvent event,
    Emitter<ForecastState> emit,
  ) async {
    emit(ForecastLoading());

    try {
      final forecast = await getForecastUseCase(event.city);
      emit(ForecastLoaded(forecast));
    } catch (e) {
      emit(ForecastError('Failed to fetch forecast: $e'));
    }
  }
}