import 'package:car_rent/controller/auth/login/cubit/login_cubit.dart';
import 'package:car_rent/core/class/crud.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:car_rent/data/data_source/remote/auth/login.dart';
import 'package:car_rent/data/model/login_requst.dart';
import 'package:car_rent/l10n/app_localizations.dart';
import 'package:car_rent/view/pages/auth/regster.dart';
import 'package:car_rent/view/pages/home/home.dart';
import 'package:car_rent/view/widget/auth/auth_app_bar.dart';
import 'package:car_rent/view/widget/auth/widge_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _goToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    void goToHome() {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => Home()),
        (route) => false,
      );
    }

    final t = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => LoginCubit(LoginData(Crud())),
      child: Scaffold(
        appBar: AuthAppBar(title: t?.login ?? 'Login'),
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginLoading) {
              CircularProgressIndicator();
            }
            if (state is LoginSuccess) {
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
                                  LoginRequst(
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
