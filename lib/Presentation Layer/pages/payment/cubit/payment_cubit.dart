import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_state.dart';
part 'payment_cubit.freezed.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(const PaymentState.initial());

  Future<void> processPayment({required double amount}) async {
    // 1. إرسال حالة التحميل
    emit(const PaymentState.loading());

    try {
      // 2. محاكاة تأخير الشبكة (مثلاً ثانيتين)
      await Future.delayed(const Duration(seconds: 2));

      // 3. محاكاة منطق النجاح أو الفشل
      // يمكنك تغيير هذا الشرط لاختبار حالة الخطأ
      if (amount > 0) {
        emit(const PaymentState.success());
      } else {
        emit(const PaymentState.error("المبلغ يجب أن يكون أكبر من صفر"));
      }
    } catch (e) {
      emit(PaymentState.error("حدث خطأ غير متوقع: ${e.toString()}"));
    }
  }

  // دالة لإعادة الحالة للبداية إذا لزم الأمر
  void reset() => emit(const PaymentState.initial());
}
