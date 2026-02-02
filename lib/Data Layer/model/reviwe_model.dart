import 'package:freezed_annotation/freezed_annotation.dart';

part 'reviwe_model.freezed.dart';
part 'reviwe_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    required int reviewId,
    required int carId,
    required int userId,
    required int stars,
    required String review,
    required DateTime createdAt,

    // Extra info from joins
    String? userFullName,
    String? carBrand,
    String? carModel,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
