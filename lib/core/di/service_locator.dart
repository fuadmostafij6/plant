

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:plant/core/db/isar_services.dart';

import 'package:plant/core/network/network.dart';
import 'package:plant/feature/languages/services/language_services.dart';

import 'package:plant/feature/feature.dart';


final getIt = GetIt.instance;

void setupLocator() {
  final baseUrl = dotenv.env["BASEURL"];
  if (baseUrl == null || baseUrl.isEmpty) {
    throw Exception("BASEURL is not defined in .env file");
  }
  getIt.registerSingleton<IsarService>(IsarService());
  getIt.registerLazySingleton(() => LanguageService(getIt<IsarService>()));
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(baseUrl: baseUrl));
}
