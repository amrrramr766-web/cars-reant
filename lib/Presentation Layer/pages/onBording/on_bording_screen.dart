import 'package:car_rent/Presentation%20Layer/pages/onBording/cubit/cubit/on_bording_cubit.dart';
import 'package:car_rent/Data%20Layer/Local%20Data%20Sources/on_boarding_model.dart';
import 'package:car_rent/Presentation%20Layer/pages/onBording/widget/list_index.dart';
import 'package:car_rent/Presentation%20Layer/pages/onBording/widget/on_bording_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBordingCubit(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlocBuilder<OnBordingCubit, int>(
                builder: (context, currentIndex) {
                  return OnBordingMain(
                    pageController: _pageController,
                    onPageChanged: (index) {
                      context.read<OnBordingCubit>().updateIndex(index);
                    },

                    // يمكن تمرير الترجمة إذا كانت هناك نصوص داخل OnBordingMain
                  );
                },
              ),
              const SizedBox(height: 20),
              BlocBuilder<OnBordingCubit, int>(
                builder: (context, currentIndex) {
                  return ListIndex(
                    pageController: _pageController,
                    itemCount: onBoardingList(context).length,
                  );
                },
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
