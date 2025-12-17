import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

enum BookingStatus { pending, confirmed, cancelled }

@freezed
class BookingModel with _$BookingModel {
  const factory BookingModel({
    @JsonKey(name: 'bookingID') int? id,

    String? startDate,
    String? endDate,

    double? totalPrice,

    BookingStatus? status,

    @JsonKey(name: 'userID') int? userId,

    @JsonKey(name: 'carID') int? carId,

    // Joined/extended fields that may come from the backend
    String? fullName,
    String? brand,
    String? model,
    String? year,
  }) = _BookingModel;

  factory BookingModel.fromJson(Map<String, dynamic> json) =>
      _$BookingModelFromJson(json);
}
