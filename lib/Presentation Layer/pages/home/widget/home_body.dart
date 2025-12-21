import 'package:car_rent/Presentation%20Layer/pages/home/cubit/cubit/home_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/Car%20List/car_list.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/offer_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeError) {
          return Center(child: Text(state.errorMessage));
        } else if (state is HomeLoaded) {
          return RefreshIndicator(
            onRefresh: () => context.read<HomeCubit>().loadHomeData(),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  OfferBanner(offers: state.offers),
                  const SizedBox(height: 16),
                  CarList(cars: state.cars, title: 'Recommended Cars'),
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
