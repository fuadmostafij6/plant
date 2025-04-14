
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:plant/core/core.dart';
import 'package:plant/feature/languages/services/language_services.dart';
part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState(locale: Locale('en', 'US'))) {
    // Event handler for loading language
    on<LoadLanguageEvent>(_onLoadLanguage);
    // Event handler for updating language
    on<UpdateLanguageEvent>(_onUpdateLanguage);
  }

  Future<void> _onLoadLanguage(
      LoadLanguageEvent event,
      Emitter<LanguageState> emit,
      ) async {
    try {
      final langService = getIt<LanguageService>();
      final languageCode = await langService.getLanguage();

      if (languageCode != null && languageCode.isNotEmpty) {
        // Check if the language code includes a country code, e.g., "en_US".
        final parts = languageCode.split('_');
        final locale = parts.length > 1
            ? Locale(parts[0], parts[1])
            : Locale(languageCode, 'US'); // Default country if not provided
        emit(state.copyWith(locale: locale, error: null));
      }
    } catch (e) {
      debugPrint('Error loading language: $e');
      emit(state.copyWith(error: 'Error loading language: $e'));
    }
  }

  Future<void> _onUpdateLanguage(
      UpdateLanguageEvent event,
      Emitter<LanguageState> emit,
      ) async {
    try {
      final langService = getIt<LanguageService>();
      // Save the new language using the service.
      langService.saveLanguage(event.languageCode);
      // After saving, trigger loading to update the locale.
      add( LoadLanguageEvent());
    } catch (e) {
      debugPrint('Error updating language: $e');
      emit(state.copyWith(error: 'Error updating language: $e'));
    }
  }
}
