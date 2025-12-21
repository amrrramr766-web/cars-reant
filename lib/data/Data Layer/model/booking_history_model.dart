import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_history_model.freezed.dart';
part 'booking_history_model.g.dart';

@freezed
class BookingHistoryModel with _$BookingHistoryModel {
  const factory BookingHistoryModel({
    @JsonKey(name: 'bookingID') int? bookingID,

    @JsonKey(name: 'userID') int? userID,

    @JsonKey(name: 'carID') int? carID,

    double? totalPrice,

    String? status,
    String? startDate,
    String? endDate,
    String? createdAt,

    // Joined fields
    String? fullName,
    String? brand,
    String? model,
    String? year,
  }) = _BookingHistoryModel;

  factory BookingHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$BookingHistoryModelFromJson(json);
}
