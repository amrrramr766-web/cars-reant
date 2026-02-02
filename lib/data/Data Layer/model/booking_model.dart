import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:car_rent/Domain%20Layer/Entities/booking_entity.dart';

part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

/// Custom JSON converter for BookingStatus enum
class BookingStatusConverter implements JsonConverter<BookingStatus, String> {
  const BookingStatusConverter();

  @override
  BookingStatus fromJson(String json) {
    return BookingStatus.fromString(json);
  }

  @override
  String toJson(BookingStatus object) {
    return object.value;
  }
}

@freezed
class BookingModel with _$BookingModel {
  const BookingModel._();

  const factory BookingModel({
    @JsonKey(name: 'bookingID') int? id,

    String? startDate,
    String? endDate,

    double? totalPrice,

    @BookingStatusConverter() BookingStatus? status,

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

  /// Converts the data model to domain entity
  BookingEntity toEntity() {
    return BookingEntity(
      id: id ?? 0,
      startDate: startDate != null
          ? DateTime.parse(startDate!)
          : DateTime.now(),
      endDate: endDate != null ? DateTime.parse(endDate!) : DateTime.now(),
      totalPrice: totalPrice ?? 0.0,
      status: status ?? BookingStatus.pending,
      brand: brand ?? "",
      model: model ?? "",
      userId: userId ?? 0,
      carId: carId ?? 0,
    );
  }
}
