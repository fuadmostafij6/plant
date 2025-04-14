import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant/core/constants/app_constant/app_icon/png.dart';
import 'package:plant/core/core.dart';
import 'package:plant/feature/auth/bloc/auth/auth_bloc.dart';

import 'bloc/splash_bloc.dart'; // Import your PoweredBy widget or other core functionalities

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(FirebaseAuth.instance)..add(AppStarted()),
      child: const SplashView(),
    );
  }
}

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          // Navigate to the home page using GoRouter replacement method.
          // context.go() replaces the current route.
          context.go(AppRoutes.HOME);
        }
        if (state is AuthUnauthenticated) {
          // Navigate to the sign-in page using GoRouter replacement method.
          context.go(AppRoutes.SIGN_IN);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Center(
                child: Image.asset(
                  PngIcon.splash,
                  height: 214.w,
                  width: 214.w,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 32,
                child: PoweredBy.poweredBy(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
