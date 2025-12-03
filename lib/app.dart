import 'package:flutter/material.dart';
import 'package:hermes/features/auth/start_page.dart';
import 'package:hermes/shared/light_theme.dart';
import 'package:hermes/shared/router.dart';
import 'features/auth/auth_state_provider.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<AuthStateProvider>(context);
    // return MaterialApp.router(
    //   routerConfig: getRouter(provider),
    //   title: 'Hermes',
    //   theme: lightTheme,
    // );
    return MaterialApp(title: 'Hermes', theme: lightTheme, home: StartPage());
  }
}
