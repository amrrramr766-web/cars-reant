import 'package:bloc/bloc.dart';
import 'package:car_rent/Domain%20Layer/Entities/user_entity.dart';
import 'package:car_rent/Data%20Layer/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthRepository authRepository;
  UserCubit(this.authRepository) : super(UserInitial());

  Future<void> fetchUser() async {
    emit(UserLoading());

    final result = await authRepository.getCurrentUser();

    result.fold(
      (failure) {
        emit(UserError('Failed to fetch user data'));
      },
      (userModel) {
        emit(UserLoaded(userModel.toEntity()));
      },
    );
  }
}
