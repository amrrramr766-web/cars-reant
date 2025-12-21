import 'dart:async';

import 'package:car_rent/Presentation%20Layer/pages/home/widget/offer_card.dart';
import 'package:car_rent/data/Data%20Layer/model/offer_model.dart';
import 'package:flutter/material.dart';

class OfferBanner extends StatefulWidget {
  final List<OfferModel> offers;

  const OfferBanner({super.key, required this.offers});

  @override
  State<OfferBanner> createState() => _OfferBannerState();
}

class _OfferBannerState extends State<OfferBanner> {
  final PageController _pageController = PageController();
  Timer? _autoSlideTimer;
  bool _userIsScrolling = false;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _autoSlideTimer?.cancel();
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 20), (timer) {
      if (!_userIsScrolling && _pageController.hasClients) {
        final currentPage = _pageController.page?.round() ?? 0;
        final nextPage = currentPage + 1 < widget.offers.length
            ? currentPage + 1
            : 0;

        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollStartNotification) {
          _userIsScrolling = true;
        } else if (notification is ScrollEndNotification) {
          _userIsScrolling = false;
        }
        return false;
      },
      child: SizedBox(
        height: 230,
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.offers.length,
          itemBuilder: (context, index) {
            final offer = widget.offers[index];
            return OfferCard(offer: offer);
          },
        ),
      ),
    );
  }
}
