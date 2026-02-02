import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/checkout_app_bar.dart';
import '../widgets/booking_summary_card.dart';
import '../widgets/payment_section_header.dart';
import '../widgets/payment_form.dart';
import '../widgets/secure_message.dart';
import '../widgets/checkout_footer.dart';

import 'package:go_router/go_router.dart';
import 'package:car_rent/core/constant/app_route.dart';
import 'package:car_rent/Presentation%20Layer/pages/payment/checkout/helper/checkout_args.dart';
import 'package:car_rent/Presentation%20Layer/pages/payment/cubit/payment_cubit.dart';

class CheckoutPage extends StatelessWidget {
  final String image;
  final String name;
  final String date;
  final String price;
  const CheckoutPage({
    super.key,
    required this.image,
    required this.name,
    required this.date,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F7F8),
        body: Stack(
          children: [
            Column(
              children: [
                CheckoutAppBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 140),
                    child: Column(
                      children: [
                        BookingSummaryCard(
                          image: image,
                          name: name,
                          date: date,
                          price: price,
                        ),
                        PaymentSectionHeader(),
                        PaymentForm(),
                        SecureMessage(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            BlocConsumer<PaymentCubit, PaymentState>(
              listener: (context, state) {
                state.whenOrNull(
                  success: () {
                    // الانتقال لصفحة النجاح عند اكتمال المحاكاة بنجاح
                    context.push(
                      AppRoute.paymentSuccess,
                      extra: CheckoutArgs(
                        image: image,
                        name: name,
                        date: date,
                        price: price,
                        transactionId:
                            "MOCK-${DateTime.now().millisecondsSinceEpoch}", // معرف وهمي
                      ),
                    );
                  },
                  error: (message) {
                    // إظهار رسالة خطأ للمستخدم
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                // تحقق من حالة التحميل باستخدام when
                bool isLoading = state.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                );

                return CheckoutFooter(
                  totalPrice: double.parse(price),
                  onPayTap: isLoading
                      ? null // تعطيل الزر أثناء التحميل
                      : () => context.read<PaymentCubit>().processPayment(
                          amount: double.parse(price),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
