abstract class PredictionState {}

class PredictionInitial extends PredictionState {}

class PredictionLoading extends PredictionState {}

class PredictionLoaded extends PredictionState {
  final int prediction;  // Or the full `Prediction` entity if necessary
  
  PredictionLoaded(this.prediction);
}

class PredictionError extends PredictionState {
  final String errorMessage;

  PredictionError(this.errorMessage);
}