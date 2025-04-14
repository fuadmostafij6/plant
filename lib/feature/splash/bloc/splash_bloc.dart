import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {
      emit(SplashNavigateToHome());
    });
    _startTimer();
  }

  Future<void> _startTimer() async {
    await Future.delayed(Duration(seconds: 3));
    add(SplashTimerFinished());
  }
}
