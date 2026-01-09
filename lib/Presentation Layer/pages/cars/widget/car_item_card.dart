import 'package:car_rent/Domain%20Layer/Entities/car_entity.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/cubit/cubit/booking_cubit.dart';
import 'package:car_rent/Presentation%20Layer/pages/booking/pages/booking.dart';
import 'package:car_rent/Presentation%20Layer/widget/common/fave_button.dart';
import 'package:car_rent/data/Data%20Layer/repositories/booking_repository.dart';
import 'package:car_rent/server_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarItemCard extends StatelessWidget {
  final CarEntity car;
  final bool reversed;
  final bool isDark;

  const CarItemCard({
    super.key,
    required this.car,
    required this.reversed,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final image = Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            color: Colors.grey,
            width: 500,
            height: 190,
            child: Image.network(car.imageUrl, fit: BoxFit.cover),
          ),
        ),
        Positioned(
          top: 8,
          left: reversed ? null : 8,
          right: reversed ? 8 : null,
          child: faveButton(
            carId: car.id,
            isDark: isDark,
            isFavorited: car.isFavorite,
          ),
        ),
      ],
    );

    final details = Column(
      crossAxisAlignment: reversed
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Text(
          car.brand.toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          car.model,
          textAlign: reversed ? TextAlign.right : TextAlign.left,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: reversed
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Text(
              "\$${car.pricePerDay.toStringAsFixed(0)}",
              style: const TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "\$${car.pricePerDay.toStringAsFixed(0)}",
              style: const TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: reversed ? Colors.black : Colors.red,
            shape: const StadiumBorder(),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (_) => BookingCubit(sl<BookingRepository>()),
                  child: BookingReviewPage(car: car),
                ),
              ),
            );
          },
          child: const Text("Add to Cart"),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: reversed
            ? [
                Expanded(child: details),
                const SizedBox(width: 16),
                SizedBox(width: 250, child: image),
              ]
            : [
                SizedBox(width: 250, child: image),
                const SizedBox(width: 16),
                Expanded(child: details),
              ],
      ),
    );
  }
}
