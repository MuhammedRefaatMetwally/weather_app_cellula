import 'dart:convert';
import 'package:http/http.dart' as http;
import '../domain/Prediction.dart';

abstract class PredictionRemoteDataSource {
  Future<Prediction> getPrediction(List<int> features);
}

class PredictionRemoteDataSourceImpl implements PredictionRemoteDataSource {
  @override
  Future<Prediction> getPrediction(List<int> features) async {
    final url = Uri.parse('http://192.168.1.8:5001/predict');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'features': features}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Print the entire response to check the structure
      print('Response data: $data');

      // Adjust this line according to the actual response
      return Prediction(data['prediction']);  // Replace 'prediction' with the correct key if needed
    } else {
      throw Exception('Failed to load prediction');
    }
  }
}