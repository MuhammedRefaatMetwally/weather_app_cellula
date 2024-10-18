import 'Prediction.dart';

abstract class PredictionRepository {
 Future<Prediction> getPrediction(List<int> features);
}

class GetPredictionUseCase {
  final PredictionRepository repository;

  GetPredictionUseCase(this.repository);

  Future<Prediction> call(List<int> features) {
    return repository.getPrediction(features);
  }
}