part of 'user_bloc.dart';



sealed class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoading extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UserLoaded extends UserState {
  final UserModel user;
   const UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

class UserError extends UserState {
  final String message;
   const UserError(this.message);

  @override
  List<Object?> get props => [message];
}
