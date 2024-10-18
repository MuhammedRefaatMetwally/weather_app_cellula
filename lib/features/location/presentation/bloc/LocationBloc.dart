import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../domain/GetCurrentLocationUseCase.dart';
import 'LocationEvent.dart';
import 'LocationState.dart';


class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GetCurrentLocationUseCase getCurrentLocationUseCase;

  LocationBloc({required this.getCurrentLocationUseCase}) : super(LocationInitial()) {
    // Listen for FetchLocationEvent
    on<FetchLocationEvent>(_onFetchLocationEvent);
  }

  // Handle the FetchLocationEvent
  Future<void> _onFetchLocationEvent(FetchLocationEvent event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    print('LocationLoading emitted');

    final permissionGranted = await _checkLocationPermissions();
    if (!permissionGranted) {
      print('Permission denied');
      emit(LocationError('Location permission denied'));
      return;
    }

    try {
      final location = await getCurrentLocationUseCase();
      print('Location loaded: $location');
      emit(LocationLoaded(location));
    } catch (e) {
      print('Error fetching location: $e');
      emit(LocationError('Failed to fetch location: $e'));
    }
  }

  // Function to check location permissions and request if needed
  Future<bool> _checkLocationPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    return permission == LocationPermission.whileInUse || permission == LocationPermission.always;
  }
}

