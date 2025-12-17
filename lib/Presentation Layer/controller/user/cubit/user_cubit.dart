import 'package:bloc/bloc.dart';
import 'package:car_rent/Data%20Layer/repositories/auth_repository.dart';
import 'package:car_rent/Data%20Layer/model/user_model.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final AuthRepository authRepository;
  UserCubit(this.authRepository) : super(UserInitial()) {
    print("👤 [UserCubit] UserCubit initialized");
  }

  Future<void> fetchUser(int id) async {
    print("🔍 [UserCubit] fetchUser() called with ID: $id");
    emit(UserLoading());
    print("⏳ [UserCubit] Fetching user data from backend...");

    final result = await authRepository.getCurrentUser();
    print("📡 [UserCubit] Fetch user result received");

    result.fold(
      (failure) {
        print("❌ [UserCubit] Failed to fetch user data: $failure");
        emit(UserError('Failed to fetch user data'));
      },
      (data) {
        final user = UserModel.fromJson(data as Map<String, dynamic>);
        print(
          "✅ [UserCubit] User fetched successfully: ${user.fullName}, ${user.email}",
        );
        emit(UserLoaded(user));
      },
    );
  }
}
