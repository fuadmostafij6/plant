part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthLoading extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthAuthenticated extends AuthState {
  final String uid;
  const AuthAuthenticated(this.uid);

  @override
  List<Object?> get props => [uid];
}

class AuthUnauthenticated extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthRegistrationSuccess extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
//
class AuthLoginSuccess extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
//
// class AuthOtpSent extends AuthState {}
//
// class AuthOtpVerified extends AuthState {}
//
// class AuthPasswordResetSent extends AuthState {}

class AuthFailure extends AuthState {
  final String error;
  const AuthFailure(this.error);

  @override
  List<Object?> get props => [error];
}