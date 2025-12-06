import 'package:car_rent/data/model/car_model.dart';
import 'package:equatable/equatable.dart';

class FavorCarsModel extends Equatable {
  int? favoriteID;
  int? userID;
  int? itemID;
  String? createdAt;
  String? itemName;
  double? pricePerDay;
  bool? isAvailable;
  bool? isFave;
  String? imageURL;
  String? gas;
  String? gear;
  int? seat;

  FavorCarsModel({
    this.favoriteID,
    this.userID,
    this.itemID,
    this.createdAt,
    this.itemName,
    this.pricePerDay,
    this.isAvailable,
    this.isFave,
    this.imageURL,
    this.gas,
    this.gear,
    this.seat,
  });

  FavorCarsModel.fromJson(Map<String, dynamic> json) {
    favoriteID = json['favoriteID'];
    userID = json['userID'];
    itemID = json['itemID'];
    createdAt = json['createdAt'];
    itemName = json['itemName'];
    pricePerDay = json['pricePerDay'];
    isAvailable = json['isAvailable'];
    isFave = json['isFave'];
    imageURL = json['imageURL'];
    gas = json['gas'];
    gear = json['gear'];
    seat = json['seat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favoriteID'] = favoriteID;
    data['userID'] = userID;
    data['itemID'] = itemID;
    data['createdAt'] = createdAt;
    data['itemName'] = itemName;
    data['pricePerDay'] = pricePerDay;
    data['isAvailable'] = isAvailable;
    data['isFave'] = isFave;
    data['imageURL'] = imageURL;
    data['gas'] = gas;
    data['gear'] = gear;
    data['seat'] = seat;
    return data;
  }

  CarModel toCarModel() {
    return CarModel(
      carID: itemID,
      brand: itemName,
      model: "",
      year: "",
      imageUrl: imageURL,
      plateNumber: "",
      gear: gear,
      gas: gas,
      pricePerDay: pricePerDay?.toDouble(),
      seat: seat,
      isAvailable: isAvailable,
      isFave: isFave,
      createdAt: createdAt,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    favoriteID,
    userID,
    itemID,
    createdAt,
    itemName,
    pricePerDay,
    isAvailable,
    isFave,
    imageURL,
    gas,
    gear,
    seat,
  ];
}
