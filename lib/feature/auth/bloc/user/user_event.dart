part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object?> get props => [];
}

class GetUserByUid extends UserEvent {
  final String uid;
  const GetUserByUid(this.uid);

  @override
  List<Object?> get props => [uid];
}
