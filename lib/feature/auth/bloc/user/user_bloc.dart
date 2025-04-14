import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plant/feature/auth/model/user.dart';
import 'package:plant/feature/auth/services/auth_services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthServices userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<GetUserByUid>(_onGetUserByUid);
  }

  Future<void> _onGetUserByUid(GetUserByUid event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final user = await userRepository.getUserByUid(event.uid);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
