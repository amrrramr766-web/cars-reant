import 'package:freezed_annotation/freezed_annotation.dart';

part 'car_model.freezed.dart';
part 'car_model.g.dart';

@freezed
class CarModel with _$CarModel {
  const factory CarModel({
    int? carID,
    String? brand,
    String? model,
    String? year,
    String? imageUrl,
    String? plateNumber,
    String? gear,
    String? gas,
    double? pricePerDay,
    int? seat,
    bool? isAvailable,
    bool? isFave,
    String? createdAt,
  }) = _CarModel;

  factory CarModel.fromJson(Map<String, dynamic> json) =>
      _$CarModelFromJson(json);
}
