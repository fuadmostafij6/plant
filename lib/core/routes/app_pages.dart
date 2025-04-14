import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:plant/feature/auth/reset_pass/reset_pass.dart';
import 'package:plant/feature/auth/send_otp/send_otp.dart';
import 'package:plant/feature/auth/sign_in/sign_in.dart';
import 'package:plant/feature/auth/sign_up/sign_up.dart';
import 'package:plant/feature/auth/verify_otp/verify_otp.dart';

import 'package:plant/feature/feature.dart';
import 'package:plant/feature/home/screen/add_screen/add_screen.dart';
import 'package:plant/feature/home/screen/details/details.dart';
import 'package:plant/feature/home/screen/home/home.dart';
import 'package:plant/feature/home/screen/result/result.dart';

import 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL = AppRoutes.SPLASH;

  static GoRouter generateRoute = GoRouter(
    routes: [
      GoRoute(path: INITIAL, builder: (context, state) => Splash()),
      GoRoute(
        path: AppRoutes.SIGN_IN,
        builder: (context, state) => SignIn(),
        routes: <RouteBase>[
          // Add child routes
          GoRoute(
            path: AppRoutes.SIGN_UP,
            builder: (context, state) => SignUp(),
          ),
          GoRoute(
            path: AppRoutes.SEND_OTP,
            builder: (context, state) => SendOtp(),
            routes: [
              GoRoute(
                path: AppRoutes.VERIFY_OTP,
                builder: (context, state) {
                  final email = state.extra as String;
                  return VerifyOtp(email: email);
                },
              ),
              GoRoute(
                path: AppRoutes.RESET_PASS,
                builder: (context, state) => ResetPass(),
              ),
            ],
          ),
        ],
      ),

      GoRoute(
        path: AppRoutes.HOME,
        builder: (context, state) => Home(),
        routes: [
          GoRoute(
            path: AppRoutes.DETAIL,
            builder: (context, state) {
              final details = state.extra as DetailsArg;
              return Details(detailsArg: details);
            },
          ),

          GoRoute(
            path: AppRoutes.Add_SCREEN,
            builder: (context, state) {
              // final details = state.extra as DetailsArg;
              return AddScreen();
            },
            routes: [
              GoRoute(
                path: AppRoutes.RESULT,
                builder: (context, state) {
                  // final details = state.extra as DetailsArg;
                  return Result();
                },

              )
            ]
          ),
        ],
      ),
    ],
  );
}
