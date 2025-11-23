import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['carID'] = this.carID;
    data['brand'] = this.brand;
    data['model'] = this.model;
    data['year'] = this.year;
    data['imageUrl'] = this.imageUrl;
    data['plateNumber'] = this.plateNumber;
    data['gear'] = this.gear;
    data['gas'] = this.gas;
    data['pricePerDay'] = this.pricePerDay;
    data['seat'] = this.seat;
    data['isAvailable'] = this.isAvailable;
    data['isFave'] = this.isFave;
    data['createdAt'] = this.createdAt;
    return data;
  }

  @override
  // TODO: implement props
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
