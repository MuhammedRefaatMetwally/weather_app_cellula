import '../entity/AuthEntity.dart';

abstract class AuthRepository {
  Future<void> login(AuthEntity auth);
  Future<void> register(AuthEntity auth);
}