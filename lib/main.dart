import 'package:flutter/material.dart';

import 'features/splash/splash_screen.dart';
import 'features/loading/loading_screen.dart';
import 'features/home/home_page.dart';
import 'features/auth/sign_in_page.dart';
import 'features/auth/sign_up_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anatomatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/loading': (context) => const LoadingScreen(),
        '/home': (context) => HomePage(),
        '/sign-in': (context) => const SignInPage(),
        '/sign-up': (context) => const SignUpPage(),
      },
    );
  }
}
