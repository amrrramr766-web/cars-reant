import 'package:car_rent/Presentation%20Layer/controller/home/cubit/home_cubit.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:car_rent/Data%20Layer/model/offer_model.dart';
import 'package:car_rent/Presentation%20Layer/widget/home/car_list.dart';
import 'package:car_rent/Presentation%20Layer/widget/home/offer_banner.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // ✅ Call the Cubit to load cars and offers
    context.read<HomeCubit>().loadHomeData();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          });
        }
      },
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final offerModels = state is HomeLoaded
            ? state.offers
                  .map(
                    (offer) => OfferModel(
                      id: offer.id,
                      imageUrl: offer.imageUrl,
                      description: offer.description,
                      persenteg: offer.persenteg,
                      endDate: offer.endDate,
                    ),
                  )
                  .toList()
            : <OfferModel>[];

        final popularCars = state is HomeLoaded
            ? state.cars.cast<CarModel>()
            : <CarModel>[];

        return RefreshIndicator(
          onRefresh: () => context.read<HomeCubit>().loadHomeData(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                if (offerModels.isNotEmpty)
                  OfferBanner(
                    offers: offerModels,
                    pageController: pageController,
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                if (offerModels.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: DotsIndicator(
                      dotsCount: offerModels.length,
                      position: currentIndex.toDouble(),
                      decorator: DotsDecorator(
                        size: const Size.square(8.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
                CarList(
                  pageController: pageController,
                  currentIndex: currentIndex,
                  cars: popularCars,
                  title: 'Popular Cars',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
