part of 'language_bloc.dart';




class LanguageState extends Equatable {
  final Locale locale;
  final String? error;

  const LanguageState({
    required this.locale,
    this.error,
  });

  LanguageState copyWith({
    Locale? locale,
    String? error,
  }) {
    return LanguageState(
      locale: locale ?? this.locale,
      error: error,
    );
  }

  @override
  List<Object?> get props => [locale, error];
}