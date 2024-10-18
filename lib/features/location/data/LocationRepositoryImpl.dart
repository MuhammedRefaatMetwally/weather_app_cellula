import 'package:geolocator/geolocator.dart';

import '../domain/LocationEntity.dart';
import '../domain/LocationRepository.dart';

class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<LocationEntity> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return LocationEntity(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      // You can log or return a more detailed error here
      throw Exception("Failed to get current location: $e");
    }
  }
}