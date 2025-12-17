import 'package:flutter/material.dart';
import 'package:car_rent/Data%20Layer/model/car_model.dart';

class CarDetailAppBar extends StatelessWidget {
  final CarModel car;
  const CarDetailAppBar({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: (car.imageUrl != null && car.imageUrl!.isNotEmpty)
            ? Image.network(
                car.imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const Center(
                  child: Icon(
                    Icons.directions_car,
                    size: 80,
                    color: Colors.grey,
                  ),
                ),
              )
            : Container(
                color: Colors.grey[300],
                child: const Center(
                  child: Icon(
                    Icons.directions_car,
                    size: 80,
                    color: Colors.grey,
                  ),
                ),
              ),
      ),
    );
  }
}
