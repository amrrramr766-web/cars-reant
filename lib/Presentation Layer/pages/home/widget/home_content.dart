import 'package:car_rent/Presentation%20Layer/pages/home/cubit/cubit/home_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/home_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.status == HomeStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage ?? 'An error occurred')),
          );
        }
      },
      child: const HomeBody(),
    );
  }
}
