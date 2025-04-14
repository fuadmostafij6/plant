

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant/bloc/language_bloc.dart' show LanguageBloc, LoadLanguageEvent;
import 'package:plant/feature/auth/bloc/auth/auth_bloc.dart';
import 'package:plant/feature/splash/bloc/splash_bloc.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:plant/feature/feature.dart';

import '../feature/home/bloc/scenario_bloc.dart';

class ProviderList {
  ProviderList._();

  static List<SingleChildWidget> providerList=<SingleChildWidget>[
    BlocProvider<LanguageBloc>(
      create: (context) => LanguageBloc()..add(LoadLanguageEvent()),
    ),

    BlocProvider<SplashBloc>(
      create: (context) => SplashBloc()
    ),
    BlocProvider<ScenarioBloc>(
        create: (context) => ScenarioBloc()
    ),
    BlocProvider<AuthBloc>(
        create: (context) =>AuthBloc(FirebaseAuth.instance)..add(AppStarted())
    ),


  ];
}