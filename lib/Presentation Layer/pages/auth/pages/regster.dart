import 'package:car_rent/data/Data%20Layer/Local%20Data%20Sources/auth_local_data_source.dart';
import 'package:car_rent/data/Data%20Layer/repositories/auth_repository.dart';
import 'package:car_rent/Presentation%20Layer/pages/auth/cubit/REGSTER/cubit/regster_cubit.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:car_rent/core/constant/validator_class.dart';
import 'package:car_rent/l10n/app_localizations.dart';
import 'package:car_rent/Presentation%20Layer/pages/auth/pages/login.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/home.dart';
import 'package:car_rent/Presentation%20Layer/pages/auth/widget/auth_app_bar.dart';
import 'package:car_rent/server_locator.dart';
import 'package:flutter/material.dart';
import 'package:car_rent/Presentation%20Layer/pages/auth/widget/text_form_filed.dart';
import 'package:car_rent/Presentation%20Layer/pages/auth/widget/widge_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final validator = ValidatorClass();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _register(BuildContext blocContext) {
    if (_formKey.currentState!.validate()) {
      blocContext.read<RegsterCubit>().postdata(
        fullNameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
        phoneController.text.trim(),
      );
    }
  }

  void _goToLogin() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);

    return BlocProvider(
      create: (context) =>
          RegsterCubit(sl<AuthRepository>(), sl<AuthLocalDataSource>()),
      child: Scaffold(
        appBar: AuthAppBar(title: t?.register ?? 'Register'),
        body: BlocConsumer<RegsterCubit, RegsterState>(
          listener: (context, state) {
            if (state is RegsterSuccess) {
              // Show snackbar first
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Welcome, ${state.name}!'),
                  duration: Duration(seconds: 2),
                ),
              );

              // Navigate after delay
              Future.delayed(Duration(seconds: 2), () {
                if (mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Home()),
                  );
                }
              });
            } else if (state is RegsterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
          builder: (context, state) {
            return state is RegsterLoading
                ? const Center(child: CircularProgressIndicator())
                : Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(15),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormFieldWidget(
                                hintText: t?.fullName ?? 'Full Name',
                                icon: Icons.person,
                                controller: fullNameController,
                                validator: validator.fullNameValidator,
                              ),
                              const SizedBox(height: 20),
                              TextFormFieldWidget(
                                hintText: t?.email ?? 'Email',
                                icon: Icons.email,
                                controller: emailController,
                                validator: validator.emailValidator,
                              ),
                              const SizedBox(height: 20),
                              TextFormFieldWidget(
                                hintText: t?.password ?? 'Password',
                                icon: Icons.lock,
                                controller: passwordController,
                                obscureText: true,
                                validator: validator.passwordValidator,
                              ),
                              const SizedBox(height: 20),
                              TextFormFieldWidget(
                                hintText: t?.phone ?? 'Phone',
                                icon: Icons.phone,
                                controller: phoneController,
                                validator: validator.phoneValidator,
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    t?.alreadyHaveAccount ??
                                        "Already have an account? ",
                                  ),
                                  GestureDetector(
                                    onTap: _goToLogin,
                                    child: Text(
                                      t?.login ?? "Login",
                                      style: TextStyle(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 30),
                              Builder(
                                builder: (ctx) => WidgeButton(
                                  text: t?.register ?? 'Register',
                                  onPressed: () => _register(ctx),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
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
