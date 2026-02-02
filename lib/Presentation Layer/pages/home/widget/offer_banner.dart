import 'dart:async';

import 'package:car_rent/Presentation%20Layer/pages/home/widget/offer_card.dart';
import 'package:car_rent/Data%20Layer/model/offer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
    _tryStartAutoSlide();
  }

  @override
  void didUpdateWidget(covariant OfferBanner oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.offers.length != widget.offers.length) {
      _tryStartAutoSlide();
    }
  }

  void _tryStartAutoSlide() {
    _autoSlideTimer?.cancel();

    // ❗ Do NOT start auto-slide for 0 or 1 item
    if (widget.offers.length <= 1) return;

    _autoSlideTimer = Timer.periodic(const Duration(seconds: 20), (timer) {
      if (!mounted || _userIsScrolling || !_pageController.hasClients) {
        return;
      }

      final currentPage = _pageController.page?.round() ?? 0;
      final nextPage = (currentPage + 1) % widget.offers.length;

      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
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
    if (widget.offers.isEmpty) {
      return const SizedBox.shrink();
    }

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollStartNotification) {
          _userIsScrolling = true;
        } else if (notification is ScrollEndNotification ||
            notification is UserScrollNotification &&
                notification.direction == ScrollDirection.idle) {
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
            return OfferCard(offer: widget.offers[index]);
          },
        ),
      ),
    );
  }
}
