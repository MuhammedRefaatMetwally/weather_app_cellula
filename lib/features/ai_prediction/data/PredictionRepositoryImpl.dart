
import '../domain/Prediction.dart';
import '../domain/PredictionRepository.dart';
import 'PredictionRemoteDataSource.dart';

class PredictionRepositoryImpl implements PredictionRepository {
  final PredictionRemoteDataSource remoteDataSource;

  PredictionRepositoryImpl(this.remoteDataSource);

  @override
  Future<Prediction> getPrediction(List<int> features) async {
    try {
      final prediction = await remoteDataSource.getPrediction(features);
      return Prediction(prediction.prediction);
    } catch (e) {
      throw Exception('Failed to get prediction');
    }
  }
}