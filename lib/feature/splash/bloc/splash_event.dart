part of 'splash_bloc.dart';

sealed class SplashEvent extends Equatable {
  const SplashEvent();
}

final class SplashTimerFinished extends SplashEvent {
  @override
  List<Object> get props => [];
}