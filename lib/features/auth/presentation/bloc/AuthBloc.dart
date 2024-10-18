import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entity/AuthEntity.dart';
import '../../domain/usecases/LoginUseCase.dart';
import 'AuthEvent.dart';
import 'AuthState.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({required this.loginUseCase, required this.registerUseCase}) : super(AuthInitial()) {

    // Handler for LoginEvent
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await loginUseCase(AuthEntity(email: event.email, password: event.password));
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    // Handler for RegisterEvent
    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await registerUseCase(AuthEntity(email: event.email, password: event.password));
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
