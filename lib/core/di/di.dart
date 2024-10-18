import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/features/auth/data/AuthRepositoryImpl.dart';
import 'package:weather/features/auth/domain/repository/AuthRepository.dart';
import 'package:weather/features/auth/domain/usecases/LoginUseCase.dart';
import 'package:weather/features/auth/presentation/bloc/AuthBloc.dart';
import 'package:weather/features/home/data/api/forecast_api_service.dart';
import 'package:weather/features/home/data/repositories/forecast_repo_impl.dart';
import 'package:weather/features/home/domain/ForecastRepository.dart';
import 'package:weather/features/home/domain/usecase/GetForecastUseCase.dart';
import 'package:weather/features/home/presentation/bloc/ForecastBloc.dart';

import '../../features/location/data/LocationRepositoryImpl.dart';
import '../../features/location/domain/GetCurrentLocationUseCase.dart';
import '../../features/location/domain/LocationRepository.dart';
import '../../features/location/presentation/bloc/LocationBloc.dart';
import '../dio_factory.dart';


final getIt = GetIt.instance;
const API_KEY = "f6f4a7bd87744a0da00122226241810";

void setup() {
  // Register FirebaseAuth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Register repositories
  getIt.registerLazySingleton<LocationRepository>(
        () => LocationRepositoryImpl(),
  );
  getIt.registerLazySingleton<AuthRepository>(
        () => AuthRepositoryImpl(getIt<FirebaseAuth>()),
  );
  final Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ForecastApiService>(
        () => ForecastApiService(dio),
  );

  getIt.registerLazySingleton<ForecastRepository>(
        () => ForecastRepositoryImpl(getIt<ForecastApiService>()),
  );

  // Register use cases
  getIt.registerLazySingleton<GetCurrentLocationUseCase>(
        () => GetCurrentLocationUseCase(getIt<LocationRepository>()),
  );
  getIt.registerLazySingleton<LoginUseCase>(
        () => LoginUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
        () => RegisterUseCase(getIt<AuthRepository>()),
  );
  getIt.registerLazySingleton<GetForecastUseCase>(
        () => GetForecastUseCase(getIt<ForecastRepository>()),
  );

  // Register BLoC
  getIt.registerFactory<LocationBloc>(
        () => LocationBloc(getCurrentLocationUseCase: getIt<GetCurrentLocationUseCase>()),
  );

  getIt.registerFactory<ForecastBloc>(
        () => ForecastBloc(getIt<GetForecastUseCase>()),
  );

  getIt.registerFactory<AuthBloc>(
        () => AuthBloc(
      loginUseCase: getIt.get<LoginUseCase>(),
      registerUseCase: getIt.get<RegisterUseCase>(),
    ),
  );
}
