import 'package:car_rent/Data%20Layer/Local%20Data%20Sources/auth_local_data_source.dart';
import 'package:car_rent/Data%20Layer/model/login_requst.dart';
import 'package:car_rent/Data%20Layer/repositories/auth_repository.dart';
import 'package:car_rent/Presentation%20Layer/pages/auth/logic/auth/cubit/auth_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/auth/logic/login/cubit/login_cubit.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:car_rent/l10n/app_localizations.dart';

import 'package:car_rent/Presentation%20Layer/pages/auth/widget/auth_app_bar.dart';
import 'package:car_rent/Presentation%20Layer/pages/auth/widget/widge_button.dart';
import 'package:car_rent/server_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:car_rent/core/constant/app_route.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _goToRegister(BuildContext context) {
    context.push(AppRoute.register);
  }

  @override
  Widget build(BuildContext context) {
    void goToHome() {
      context.go(AppRoute.home);
    }

    final t = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) =>
          LoginCubit(sl<AuthRepository>(), sl<AuthLocalDataSource>()),
      child: Scaffold(
        appBar: AuthAppBar(title: t?.login ?? 'Login'),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              CircularProgressIndicator();
            }
            if (state is LoginSuccess) {
              context.read<AuthCubit>().onLoginSuccess();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.name)));
              goToHome();
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            return state is LoginLoading
                ? const Center(child: CircularProgressIndicator())
                : Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 30),

                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: t?.email ?? "Email",
                                border: const OutlineInputBorder(),
                              ),
                            ),

                            const SizedBox(height: 20),

                            TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                labelText: t?.password ?? "Password",
                                border: const OutlineInputBorder(),
                              ),
                              obscureText: true,
                            ),

                            const SizedBox(height: 10),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  t?.dontHaveAccount ??
                                      "Don't have an account? ",
                                ),
                                GestureDetector(
                                  onTap: () => _goToRegister(context),
                                  child: Text(
                                    t?.register ?? "Register",
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 30),

                            WidgeButton(
                              onPressed: () {
                                context.read<LoginCubit>().login(
                                  LoginRequest(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                );
                              },
                              text: t?.login ?? 'Login',
                            ),

                            SizedBox(height: 30.h),
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
