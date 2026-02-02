import 'package:car_rent/core/constant/app_colors.dart';
import 'package:car_rent/data/Data%20Layer/model/offer_model.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final OfferModel offer;

  const OfferCard({required this.offer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.greyShades[300],
        image: offer.imageUrl.isNotEmpty
            ? DecorationImage(
                image: NetworkImage(offer.imageUrl),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [AppColors.blackWithOpacity(0.6), AppColors.transparent],
          ),
        ),
        padding: const EdgeInsets.all(12),
        alignment: Alignment.bottomLeft,
        child: Row(
          children: [
            Expanded(
              child: Text(
                offer.description,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            _DiscountBadge(percent: offer.persenteg),
          ],
        ),
      ),
    );
  }
}

class _DiscountBadge extends StatelessWidget {
  final int percent;

  const _DiscountBadge({required this.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.accentRed.withOpacity(0.9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        '$percent%',
        style: const TextStyle(
          color: AppColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
