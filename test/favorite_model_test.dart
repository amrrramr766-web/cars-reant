import 'dart:convert';
import 'package:car_rent/data/Data%20Layer/model/favor_cars_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('FavoriteModel.fromJson parses correctly', () {
    final jsonString = '''
    [
      {
        "favoriteID": 1019,
        "userID": 1,
        "itemID": 13,
        "createdAt": "2025-11-24T19:52:07.943",
        "itemName": "Elantra 2021",
        "pricePerDay": 55.0,
        "isAvailable": true,
        "imageURL": "https://rsbkkrrhlbwkvnhgshdu.supabase.co/storage/v1/object/public/IMAGE/Hyundai%20Elantra%202021.jpg",
        "gas": "Petrol",
        "gear": "Automatic"
      },
      {
        "favoriteID": 19,
        "userID": 1,
        "itemID": 2,
        "createdAt": "2025-11-23T08:54:00.337",
        "itemName": "Camry 2022",
        "pricePerDay": 65.0,
        "isAvailable": true,
        "imageURL": "https://rsbkkrrhlbwkvnhgshdu.supabase.co/storage/v1/object/public/IMAGE/2022-Toyota-Camry-front_51303_032_1851x716_2PS_cropped.png",
        "gas": "Petrol",
        "gear": "Automatic"
      }
    ]
    ''';

    final List<dynamic> jsonList = jsonDecode(jsonString);
    final favorites = jsonList
        .map((json) => FavorCarsModel.fromJson(json))
        .toList();

    expect(favorites.length, 2);
    expect(favorites[0].favoriteID, 1019);
    expect(favorites[0].itemName, "Elantra 2021");
    expect(favorites[0].pricePerDay, 55.0);
    expect(favorites[1].favoriteID, 19);
    expect(favorites[1].itemName, "Camry 2022");
  });
}
