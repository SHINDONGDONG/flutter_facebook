import 'package:flutter/material.dart';
import 'package:flutter_facebook/features/auth/presentation/screens/create_account_screen.dart';
import '/config/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CreateAccountScreen(),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
