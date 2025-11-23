import 'dart:async';
import 'package:car_rent/data/model/offer_model.dart';
import 'package:flutter/material.dart';

class OfferBanner extends StatefulWidget {
  final List<OfferModel> offers;
  final PageController pageController;
  final Function(int) onPageChanged;

  const OfferBanner({
    super.key,
    required this.offers,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  State<OfferBanner> createState() => _OfferBannerState();
}

class _OfferBannerState extends State<OfferBanner> {
  Timer? _autoSlideTimer;
  bool _userIsScrolling = false;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _autoSlideTimer?.cancel();
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (!_userIsScrolling && widget.pageController.hasClients) {
        final nextPage =
            (widget.pageController.page?.round() ?? 0) + 1 <
                widget.offers.length
            ? (widget.pageController.page?.round() ?? 0) + 1
            : 0;

        widget.pageController.animateToPage(
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
        height: 160,
        child: PageView.builder(
          controller: widget.pageController,
          itemCount: widget.offers.length,
          onPageChanged: widget.onPageChanged,
          itemBuilder: (context, index) {
            final offer = widget.offers[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(offer.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  ),
                ),
                padding: const EdgeInsets.all(12),
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        offer.description,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        "${offer.persenteg}%",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
