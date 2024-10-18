import '../entity/AuthEntity.dart';
import '../repository/AuthRepository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<void> call(AuthEntity auth) async {
    return authRepository.login(auth);
  }
}

class RegisterUseCase {
  final AuthRepository authRepository;

  RegisterUseCase(this.authRepository);

  Future<void> call(AuthEntity auth) async {
    return authRepository.register(auth);
  }
}