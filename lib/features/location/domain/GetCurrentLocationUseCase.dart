import 'LocationEntity.dart';
import 'LocationRepository.dart';

class GetCurrentLocationUseCase {
  final LocationRepository locationRepository;

  GetCurrentLocationUseCase(this.locationRepository);

  Future<LocationEntity> call() async {
    return locationRepository.getCurrentLocation();
  }
}