import 'package:equatable/equatable.dart';

class CarModel extends Equatable {
  int? carID;
  String? brand;
  String? model;
  String? year;
  String? imageUrl;
  String? plateNumber;
  String? gear;
  String? gas;
  double? pricePerDay;
  int? seat;
  bool? isAvailable;
  bool? isFave;
  String? createdAt;

  CarModel({
    this.carID,
    this.brand,
    this.model,
    this.year,
    this.imageUrl,
    this.plateNumber,
    this.gear,
    this.gas,
    this.pricePerDay,
    this.seat,
    this.isAvailable,
    this.isFave,
    this.createdAt,
  });

  CarModel.fromJson(Map<String, dynamic> json) {
    carID = json['carID'];
    brand = json['brand'];
    model = json['model'];
    year = json['year'];
    imageUrl = json['imageUrl'];
    plateNumber = json['plateNumber'];
    gear = json['gear'];
    gas = json['gas'];
    pricePerDay = json['pricePerDay'];
    seat = json['seat'];
    isAvailable = json['isAvailable'];
    isFave = json['isFave'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['carID'] = carID;
    data['brand'] = brand;
    data['model'] = model;
    data['year'] = year;
    data['imageUrl'] = imageUrl;
    data['plateNumber'] = plateNumber;
    data['gear'] = gear;
    data['gas'] = gas;
    data['pricePerDay'] = pricePerDay;
    data['seat'] = seat;
    data['isAvailable'] = isAvailable;
    data['isFave'] = isFave;
    data['createdAt'] = createdAt;
    return data;
  }

  @override
  List<Object?> get props => [
    carID,
    brand,
    model,
    year,
    imageUrl,
    plateNumber,
    gear,
    gas,
    pricePerDay,
    seat,
    isAvailable,
    isFave,
    createdAt,
  ];
}
