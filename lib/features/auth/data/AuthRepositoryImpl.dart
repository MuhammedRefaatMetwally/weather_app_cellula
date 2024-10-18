import 'package:firebase_auth/firebase_auth.dart';

import '../domain/entity/AuthEntity.dart';
import '../domain/repository/AuthRepository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<void> login(AuthEntity auth) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: auth.email,
      password: auth.password,
    );
  }

  @override
  Future<void> register(AuthEntity auth) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: auth.email,
      password: auth.password,
    );
  }
}