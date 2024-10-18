abstract class PredictionEvent {}

class GetPredictionEvent extends PredictionEvent {
  final List<int> features;
  
  GetPredictionEvent(this.features);
}