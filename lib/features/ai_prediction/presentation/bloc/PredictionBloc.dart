import 'package:bloc/bloc.dart';

import '../../domain/PredictionRepository.dart';
import 'PredictionEvent.dart';
import 'PredictionState.dart';

class PredictionBloc extends Bloc<PredictionEvent, PredictionState> {
  final GetPredictionUseCase getPredictionUseCase;

  PredictionBloc(this.getPredictionUseCase) : super(PredictionInitial()) {
    on<GetPredictionEvent>(_onGetPrediction);
  }

  Future<void> _onGetPrediction(
    GetPredictionEvent event,
    Emitter<PredictionState> emit,
  ) async {
    try {
      final prediction = await getPredictionUseCase.call(event.features);
      // Ensure `prediction` is not null and properly structured.
      emit(PredictionLoaded(prediction.prediction));
    } catch (e) {
      // Log the exception to see what exactly is being caught
      print('Error during prediction: $e');
      emit(PredictionError(e.toString()));
    }
  }
}
