import 'package:equatable/equatable.dart';

class FavoriteModel extends Equatable {
  final int? favoriteID;
  final int? userID;
  final int? itemID;
  final String? createdAt;
  final String? itemName;
  final num? pricePerDay;
  final bool? isAvailable;
  final String? imageURL;
  final String? gas;
  final String? gear;

  const FavoriteModel({
    this.favoriteID,
    this.userID,
    this.itemID,
    this.createdAt,
    this.itemName,
    this.pricePerDay,
    this.isAvailable,
    this.imageURL,
    this.gas,
    this.gear,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      favoriteID: json['favoriteID'],
      userID: json['userID'],
      itemID: json['itemID'],
      createdAt: json['createdAt'],
      itemName: json['itemName'],
      pricePerDay: json['pricePerDay'],
      isAvailable: json['isAvailable'],
      imageURL: json['imageURL'],
      gas: json['gas'],
      gear: json['gear'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'favoriteID': favoriteID,
      'userID': userID,
      'itemID': itemID,
      'createdAt': createdAt,
      'itemName': itemName,
      'pricePerDay': pricePerDay,
      'isAvailable': isAvailable,
      'imageURL': imageURL,
      'gas': gas,
      'gear': gear,
    };
  }

  @override
  List<Object?> get props => [
    favoriteID,
    userID,
    itemID,
    createdAt,
    itemName,
    pricePerDay,
    isAvailable,
    imageURL,
    gas,
    gear,
  ];
}
