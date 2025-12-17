import 'package:bloc/bloc.dart';
import 'package:car_rent/Data%20Layer/Local%20Data%20Sources/auth_local_data_source.dart';
import 'package:meta/meta.dart';

part 'middlewaer_state.dart';

class MiddlewaerCubit extends Cubit<MiddlewaerState> {
  final AuthLocalDataSource authLocalDataSource;
  MiddlewaerCubit({required this.authLocalDataSource})
    : super(MiddlewaerInitial());

  Future<void> checkStep() async {
    emit(AppLoading());

    final step = await authLocalDataSource.getStep();

    if (step == "2") {
      emit(AppGoHome());
    } else if (step == "1") {
      emit(AppGoLogin());
    } else {
      emit(AppGoOnBoarding());
    }
  }
}
