import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:plant/core/core.dart';
import 'package:plant/firebase_options.dart';


abstract class Initializer {
  Initializer._();

  static void init(VoidCallback runApp) {
    ErrorWidget.builder = (errorDetails) {
      return CustomErrorWidget(
        message: errorDetails.exceptionAsString(),
      );
    };

    runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FlutterError.onError = (details) {
        FlutterError.dumpErrorToConsole(details);
        print( details.stack.toString());
      };

      await _initServices();


      runApp();
    }, (error, stack) {
      print(error.toString());
      print(stack);

    });
  }

  static Future<void> _initServices() async {
    try {
     await   Future.delayed(Duration(microseconds: 200));

      _initScreenPreference();

      _initHttp();


     await _loadEnv();
      await _dependencyInjection();
     await _initStorage();

      //
      // await _saveIp();
      //
      // await _saveDeviceName();

    } catch (err, s) {
      print(s);
      rethrow;
    }
  }

  static Future<void> _initStorage() async {

  }

  static void _initHttp (){
    HttpOverrides.global = MyHttpOverrides();
  }

  static Future<void> _dependencyInjection () async{
    setupLocator();
  }

  static Future<void> _loadEnv () async{
    await dotenv.load(fileName: ".env");
  }




  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}