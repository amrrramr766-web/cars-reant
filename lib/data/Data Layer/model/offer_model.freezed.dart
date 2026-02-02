// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) {
  return _OfferModel.fromJson(json);
}

/// @nodoc
mixin _$OfferModel {
  int get id => throw _privateConstructorUsedError; // API key is "discreption"
  @JsonKey(name: 'discreption')
  String get description =>
      throw _privateConstructorUsedError; // API key is "persenteg"
  @JsonKey(name: 'persenteg')
  int get persenteg => throw _privateConstructorUsedError;
  @JsonKey(name: 'imageUrl')
  String get imageUrl => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfferModelCopyWith<OfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferModelCopyWith<$Res> {
  factory $OfferModelCopyWith(
          OfferModel value, $Res Function(OfferModel) then) =
      _$OfferModelCopyWithImpl<$Res, OfferModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'discreption') String description,
      @JsonKey(name: 'persenteg') int persenteg,
      @JsonKey(name: 'imageUrl') String imageUrl,
      DateTime endDate});
}

/// @nodoc
class _$OfferModelCopyWithImpl<$Res, $Val extends OfferModel>
    implements $OfferModelCopyWith<$Res> {
  _$OfferModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? persenteg = null,
    Object? imageUrl = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      persenteg: null == persenteg
          ? _value.persenteg
          : persenteg // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfferModelImplCopyWith<$Res>
    implements $OfferModelCopyWith<$Res> {
  factory _$$OfferModelImplCopyWith(
          _$OfferModelImpl value, $Res Function(_$OfferModelImpl) then) =
      __$$OfferModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'discreption') String description,
      @JsonKey(name: 'persenteg') int persenteg,
      @JsonKey(name: 'imageUrl') String imageUrl,
      DateTime endDate});
}

/// @nodoc
class __$$OfferModelImplCopyWithImpl<$Res>
    extends _$OfferModelCopyWithImpl<$Res, _$OfferModelImpl>
    implements _$$OfferModelImplCopyWith<$Res> {
  __$$OfferModelImplCopyWithImpl(
      _$OfferModelImpl _value, $Res Function(_$OfferModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? persenteg = null,
    Object? imageUrl = null,
    Object? endDate = null,
  }) {
    return _then(_$OfferModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      persenteg: null == persenteg
          ? _value.persenteg
          : persenteg // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfferModelImpl implements _OfferModel {
  const _$OfferModelImpl(
      {this.id = 0,
      @JsonKey(name: 'discreption') this.description = '',
      @JsonKey(name: 'persenteg') this.persenteg = 0,
      @JsonKey(name: 'imageUrl') this.imageUrl = '',
      required this.endDate});

  factory _$OfferModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfferModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
// API key is "discreption"
  @override
  @JsonKey(name: 'discreption')
  final String description;
// API key is "persenteg"
  @override
  @JsonKey(name: 'persenteg')
  final int persenteg;
  @override
  @JsonKey(name: 'imageUrl')
  final String imageUrl;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'OfferModel(id: $id, description: $description, persenteg: $persenteg, imageUrl: $imageUrl, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfferModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.persenteg, persenteg) ||
                other.persenteg == persenteg) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, description, persenteg, imageUrl, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfferModelImplCopyWith<_$OfferModelImpl> get copyWith =>
      __$$OfferModelImplCopyWithImpl<_$OfferModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfferModelImplToJson(
      this,
    );
  }
}

abstract class _OfferModel implements OfferModel {
  const factory _OfferModel(
      {final int id,
      @JsonKey(name: 'discreption') final String description,
      @JsonKey(name: 'persenteg') final int persenteg,
      @JsonKey(name: 'imageUrl') final String imageUrl,
      required final DateTime endDate}) = _$OfferModelImpl;

  factory _OfferModel.fromJson(Map<String, dynamic> json) =
      _$OfferModelImpl.fromJson;

  @override
  int get id;
  @override // API key is "discreption"
  @JsonKey(name: 'discreption')
  String get description;
  @override // API key is "persenteg"
  @JsonKey(name: 'persenteg')
  int get persenteg;
  @override
  @JsonKey(name: 'imageUrl')
  String get imageUrl;
  @override
  DateTime get endDate;
  @override
  @JsonKey(ignore: true)
  _$$OfferModelImplCopyWith<_$OfferModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
