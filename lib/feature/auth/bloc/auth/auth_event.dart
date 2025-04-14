part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}


class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final String phone;

  const RegisterEvent({required this.email, required this.password, required this.name, required this.phone});

  @override
  List<Object> get props => [name, phone, email, password];
}
class AppStarted extends AuthEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SendOtpEvent extends AuthEvent {
  final String email;

  const SendOtpEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class VerifyOtpEvent extends AuthEvent {
  final String otp;

  const VerifyOtpEvent({required this.otp});

  @override
  List<Object> get props => [otp];
}

class ResetPasswordEvent extends AuthEvent {
  final String email;

  const ResetPasswordEvent({required this.email});

  @override
  List<Object> get props => [email];
}