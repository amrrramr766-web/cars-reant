import 'package:car_rent/Data%20Layer/model/car_model.dart';
import 'package:flutter/material.dart';

class CarInfoCard extends StatelessWidget {
  final CarModel car;
  const CarInfoCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Car Details',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: (car.imageUrl != null && car.imageUrl!.isNotEmpty)
                      ? Image.network(
                          car.imageUrl!,
                          width: 170,
                          height: 140,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                                width: 170,
                                height: 140,
                                color: Colors.grey[300],
                                child: const Center(
                                  child: Icon(
                                    Icons.directions_car,
                                    size: 48,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                        )
                      : Container(
                          width: 170,
                          height: 140,
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(
                              Icons.directions_car,
                              size: 48,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${car.model} - ${car.brand}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$${car.pricePerDay}/day",
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
