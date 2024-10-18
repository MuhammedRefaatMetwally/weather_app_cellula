import 'LocationEntity.dart';

abstract class LocationRepository {
  Future<LocationEntity> getCurrentLocation();
}