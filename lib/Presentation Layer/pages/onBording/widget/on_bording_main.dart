import 'package:car_rent/Presentation%20Layer/pages/onBording/cubit/cubit/on_bording_cubit.dart';
import 'package:car_rent/core/constant/app_colors.dart';
import 'package:car_rent/Data%20Layer/Local%20Data%20Sources/on_boarding_model.dart';
import 'package:car_rent/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBordingMain extends StatefulWidget {
  final PageController pageController;
  final Function(int) onPageChanged;

  const OnBordingMain({
    super.key,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  State<OnBordingMain> createState() => _OnBordingMainState();
}

class _OnBordingMainState extends State<OnBordingMain> {
  @override
  Widget build(BuildContext context) {
    final items = onBoardingList(context);
    final t = AppLocalizations.of(context);
    if (t == null) return const SizedBox();

    return BlocBuilder<OnBordingCubit, int>(
      builder: (context, state) {
        return Expanded(
          child: PageView.builder(
            controller: widget.pageController,
            itemCount: items.length,
            onPageChanged: (index) {
              context.read<OnBordingCubit>().updateIndex(index);
              widget.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              final item = items[index];
              String titleTranslated;
              String descriptionTranslated;

              switch (index) {
                case 0:
                  titleTranslated = t.chooseProduct;
                  descriptionTranslated = t.chooseProductDesc;
                  break;
                case 1:
                  titleTranslated = t.easyPayment;
                  descriptionTranslated = t.easyPaymentDesc;
                  break;
                case 2:
                  titleTranslated = t.fastDelivery;
                  descriptionTranslated = t.fastDeliveryDesc;
                  break;
                default:
                  titleTranslated = item.title;
                  descriptionTranslated = item.description;
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      item.image,
                      height: 300,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    titleTranslated,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    descriptionTranslated,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16, color: AppColors.grey),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
