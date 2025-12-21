import 'package:bloc/bloc.dart';
import 'package:car_rent/data/Data%20Layer/repositories/auth_repository.dart';
import 'package:car_rent/data/Data%20Layer/Local%20Data%20Sources/auth_local_data_source.dart';
import 'package:meta/meta.dart';

part 'regster_state.dart';

class RegsterCubit extends Cubit<RegsterState> {
  final AuthRepository authRepository;
  final AuthLocalDataSource _authLocalDataSource;
  RegsterCubit(this.authRepository, this._authLocalDataSource)
    : super(RegsterInitial());

  Future<void> postdata(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    emit(RegsterLoading());
    var response = await authRepository.register(
      name: name,
      email: email,
      password: password,
      phone: phone,
    );
    response.fold(
      (failure) {
        emit(RegsterFailure(failure.toString()));
      },
      (data) {
        emit(
          RegsterSuccess(
            data.userID.toString(),
            name, // Use input parameter
            data.email, // Use response email or fallback to input
            phone, // Use input parameter
          ),
        );
        _authLocalDataSource.cacheUser(data);
        _authLocalDataSource.setStep("2");
      },
    );
  }
}
