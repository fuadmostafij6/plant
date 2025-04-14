part of 'language_bloc.dart';

sealed class LanguageEvent extends Equatable {
  const LanguageEvent();
}


class UpdateLanguageEvent extends LanguageEvent {
  final String languageCode; // for example, "bn_BD"

  const UpdateLanguageEvent(this.languageCode);

  @override
  List<Object?> get props => [languageCode];
}

class LoadLanguageEvent extends LanguageEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];



}
