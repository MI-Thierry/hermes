import 'package:flutter/material.dart';
import 'app.dart';
import 'features/auth/auth_state_provider.dart';
import 'package:provider/provider.dart';

void main() {
  AuthStateProvider authStateProvider = AuthStateProvider();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthStateProvider()),
      ],
      child: App(),
    ),
  );
}
