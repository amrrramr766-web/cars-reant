import 'package:car_rent/Presentation%20Layer/pages/home/cubit/cubit/home_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/Car%20List/car_list.dart';
import 'package:car_rent/Presentation%20Layer/pages/home/widget/offer_banner.dart';
import 'package:car_rent/Presentation%20Layer/widget/common/network_error_widget.dart';
import 'package:car_rent/Presentation%20Layer/widget/skeletons/home/home_page_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    super.initState();
    final cubit = context.read<HomeCubit>();
    Future.wait([cubit.fetchCars(), cubit.getOffers()]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.networkFailure) {
          return NetworkErrorWidget(
            onRetry: () {
              final cubit = context.read<HomeCubit>();
              cubit.fetchCars();
              cubit.getOffers();
            },
          );
        }

        if (state.status == HomeStatus.failure) {
          return Center(
            child: Text(
              state.errorMessage?.isNotEmpty == true
                  ? state.errorMessage!
                  : 'Unexpected error occurred',
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () {
            final cubit = context.read<HomeCubit>();
            return Future.wait([cubit.fetchCars(), cubit.getOffers()]);
          },
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              if (state.status == HomeStatus.loading) ...[
                const HomePageSkeletonSliver(),
              ] else if (state.status == HomeStatus.success) ...[
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  sliver: SliverToBoxAdapter(
                    child: OfferBanner(offers: state.offers),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                CarList(cars: state.cars, title: 'Recommended Cars'),
              ],
            ],
          ),
        );
      },
    );
  }
}
