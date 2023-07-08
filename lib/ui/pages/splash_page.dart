import 'dart:async';

import 'package:flutter/material.dart';
import 'package:permanahome/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/onboarding',
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Container(
          width: 200,
          height: 59,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img_logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
