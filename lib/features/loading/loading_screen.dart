import 'dart:async';

import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double _progressValue = 0.0;
  Timer? _timer;

  String _tommy = 'assets/tommy/step1.png';

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    _timer = Timer.periodic(const Duration(milliseconds: 70), (timer) {
      setState(() {
        if (_progressValue < 1.0) {
          _progressValue += 0.02;

          int currentStep = (_progressValue * 50).toInt();

          if (currentStep % 2 == 0) {
            _tommy = 'assets/tommy/step1.png';
          } else {
            _tommy = 'assets/tommy/step2.png';
          }
        } else {
          _timer?.cancel();
          if (mounted) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const double foxSize = 50.0;

    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Stack(
        children: [
          Positioned(
            bottom: -150,
            right: 30,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withOpacity(0.6),
              ),
            ),
          ),

          Positioned(
            bottom: -110,
            right: -150,
            child: Container(
              width: 270,
              height: 270,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
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

                    const SizedBox(height: 60),

                    LayoutBuilder(
                      builder: (context, constraints) {
                        final double totalWidth = constraints.maxWidth;
                        final double foxPosition =
                            _progressValue * (totalWidth - foxSize);

                        return Column(
                          children: [
                            SizedBox(
                              height: foxSize,
                              width: totalWidth,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    left: foxPosition,
                                    bottom: 0,
                                    child: Image.asset(
                                      _tommy,
                                      width: foxSize,
                                      height: foxSize,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 4),

                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: _progressValue,
                                minHeight: 12,
                                backgroundColor: AppColors.white,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    Text(
                      '${(_progressValue * 100).toInt()}%',
                      style: const TextStyle(
                        fontFamily: 'nunito',
                        fontSize: 18,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
