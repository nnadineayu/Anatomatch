import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/loading');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Anatomatch',
              style: TextStyle(
                fontFamily: 'dunkin',
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 24),

            Image.asset(
              'assets/tommy/wink.png',
              width: 200,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
