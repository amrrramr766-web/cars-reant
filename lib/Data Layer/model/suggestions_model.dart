import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestions_model.freezed.dart';
part 'suggestions_model.g.dart';

@freezed
class SuggestionsModel with _$SuggestionsModel {
  const factory SuggestionsModel({
    int? id,
    String? title,
    int? carId,
    double? presPerDay,
    String? category,
    bool? isActive,
    String? createdAt,
    String? carName,
  }) = _SuggestionsModel;

  factory SuggestionsModel.fromJson(Map<String, dynamic> json) =>
      _$SuggestionsModelFromJson(json);
}
