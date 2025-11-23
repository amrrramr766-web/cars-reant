import 'package:bloc/bloc.dart';
import 'package:car_rent/data/data_source/remote/auth/regster.dart';
import 'package:meta/meta.dart';

part 'regster_state.dart';

class RegsterCubit extends Cubit<RegsterState> {
  final RegsterData regsterData;
  RegsterCubit(this.regsterData) : super(RegsterInitial());

  Future<void> postdata(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    print('💪 [RegisterCubit] postdata() called');
    print('   👤 Name: $name');
    print('   📧 Email: $email');
    print('   📁 Phone: $phone');
    emit(RegsterLoading());
    print('🌐 [RegisterCubit] Sending registration request to backend...');
    var response = await regsterData.postdata(name, email, password, phone);
    response.fold(
      (failure) {
        print('❌ [RegisterCubit] Registration failed: $failure');
        emit(RegsterFailure("فشل الاتصال بالسيرفر"));
      },
      (data) {
        print('✅ [RegisterCubit] Registration response received');
        if (data != null && data["userID"] != null) {
          print(
            '✅ [RegisterCubit] Registration successful! userID: ${data["userID"]}',
          );
          emit(
            RegsterSuccess(
              data["userID"].toString(),
              data["name"].toString(),
              data["email"].toString(),
              data["phone"].toString(),
            ),
          );
        } else {
          print('❌ [RegisterCubit] Invalid response data');
          emit(RegsterFailure("فشل التسجيل: بيانات غير صحيحة من السيرفر"));
        }
      },
    );
  }
}
