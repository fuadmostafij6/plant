import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant/feature/auth/services/auth_services.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;

  AuthBloc(this._firebaseAuth) : super(AuthInitial()) {
    on<AppStarted>((event, emit) {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        emit(AuthAuthenticated(user.uid));
      } else {
        emit(AuthUnauthenticated());
      }
    });
    on<RegisterEvent>(_onRegister);
    on<LoginEvent>(_onLogin);
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await AuthServices().registerWithEmail(
        name: event.name,
        phone: event.phone,
        email: event.email,
        password: event.password,
      );
      emit(AuthRegistrationSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final userCredential = await AuthServices().loginWithEmail(
        email: event.email,
        password: event.password,
      );
      emit(AuthAuthenticated(userCredential.user!.uid));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}

