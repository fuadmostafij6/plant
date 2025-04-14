import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plant/core/core.dart';
import 'package:plant/providers/providers.dart';
import 'package:provider/provider.dart';

import 'bloc/language_bloc.dart';
import 'core/initializer/initializer.dart';


import 'feature/languages/providers/provider.dart';


void main() {
  Initializer.init(() async {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: ProviderList.providerList,
      child: ScreenUtilInit(
          designSize:  Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) {
      ScreenUtil.init(context);
          return BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state) {

                  // Set the locale based on the provider's locale value.

              return MaterialApp.router(

                title: Strings.appName,
                theme: ThemeConfig.lightTheme,
                darkTheme: ThemeConfig.darkTheme,
                themeMode: ThemeMode.light,
                locale: state.locale,
                builder: BotToastInit(),
                debugShowCheckedModeBanner: false,
                routerDelegate: AppPages.generateRoute.routerDelegate,
                routeInformationParser: AppPages.generateRoute.routeInformationParser,
                routeInformationProvider: AppPages.generateRoute.routeInformationProvider,
                // initialRoute: AppPages.INITIAL,
                // onGenerateRoute: AppPages.generateRoute,


                // navigatorObservers: [BotToastNavigatorObserver()],
                supportedLocales: const [
                  Locale('en', 'US'), // English (United States)
                  Locale('bn', 'BD'), // Bangla (Bangladesh)
                ],
                localizationsDelegates:  [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  AppLocalizations.delegate, // Generated localization class
                ],

              );
            }
          );
        }
      ),
    );
  }
}


