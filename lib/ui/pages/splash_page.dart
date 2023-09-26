import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permanahome/shared/shared_values.dart';
import 'package:permanahome/shared/theme.dart';
import 'package:permanahome/ui/blocs/auth/auth_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        Timer(const Duration(seconds: 2), () {
          if (state is AuthSuccess) {
            globalUser = state.user;
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          }

          if (state is AuthFailed) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/onboarding',
              (route) => false,
            );
          }
        });
      },
      child: Scaffold(
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
      ),
    );
  }
}
