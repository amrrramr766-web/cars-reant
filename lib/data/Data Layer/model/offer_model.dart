import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

@freezed
class OfferModel with _$OfferModel {
  const factory OfferModel({
    @Default(0) int id,

    // API key is "discreption"
    @JsonKey(name: 'discreption') @Default('') String description,

    // API key is "persenteg"
    @JsonKey(name: 'persenteg') @Default(0) int persenteg,

    @JsonKey(name: 'imageUrl') @Default('') String imageUrl,

    required DateTime endDate,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);
}
