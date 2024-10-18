import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/di/di.dart';
import 'package:weather/features/auth/presentation/LoginScreen.dart';
import 'package:weather/features/auth/presentation/bloc/AuthBloc.dart';

import 'core/theme/AppThemes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightMode,
      home: BlocProvider(
          create: (context) => getIt.get<AuthBloc>(), child: LoginScreen()),
    );
  }
}
