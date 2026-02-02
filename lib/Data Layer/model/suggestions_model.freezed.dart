// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SuggestionsModel _$SuggestionsModelFromJson(Map<String, dynamic> json) {
  return _SuggestionsModel.fromJson(json);
}

/// @nodoc
mixin _$SuggestionsModel {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get carId => throw _privateConstructorUsedError;
  double? get presPerDay => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get carName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SuggestionsModelCopyWith<SuggestionsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionsModelCopyWith<$Res> {
  factory $SuggestionsModelCopyWith(
          SuggestionsModel value, $Res Function(SuggestionsModel) then) =
      _$SuggestionsModelCopyWithImpl<$Res, SuggestionsModel>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      int? carId,
      double? presPerDay,
      String? category,
      bool? isActive,
      String? createdAt,
      String? carName});
}

/// @nodoc
class _$SuggestionsModelCopyWithImpl<$Res, $Val extends SuggestionsModel>
    implements $SuggestionsModelCopyWith<$Res> {
  _$SuggestionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? carId = freezed,
    Object? presPerDay = freezed,
    Object? category = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? carName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      carId: freezed == carId
          ? _value.carId
          : carId // ignore: cast_nullable_to_non_nullable
              as int?,
      presPerDay: freezed == presPerDay
          ? _value.presPerDay
          : presPerDay // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      carName: freezed == carName
          ? _value.carName
          : carName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestionsModelImplCopyWith<$Res>
    implements $SuggestionsModelCopyWith<$Res> {
  factory _$$SuggestionsModelImplCopyWith(_$SuggestionsModelImpl value,
          $Res Function(_$SuggestionsModelImpl) then) =
      __$$SuggestionsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      int? carId,
      double? presPerDay,
      String? category,
      bool? isActive,
      String? createdAt,
      String? carName});
}

/// @nodoc
class __$$SuggestionsModelImplCopyWithImpl<$Res>
    extends _$SuggestionsModelCopyWithImpl<$Res, _$SuggestionsModelImpl>
    implements _$$SuggestionsModelImplCopyWith<$Res> {
  __$$SuggestionsModelImplCopyWithImpl(_$SuggestionsModelImpl _value,
      $Res Function(_$SuggestionsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? carId = freezed,
    Object? presPerDay = freezed,
    Object? category = freezed,
    Object? isActive = freezed,
    Object? createdAt = freezed,
    Object? carName = freezed,
  }) {
    return _then(_$SuggestionsModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      carId: freezed == carId
          ? _value.carId
          : carId // ignore: cast_nullable_to_non_nullable
              as int?,
      presPerDay: freezed == presPerDay
          ? _value.presPerDay
          : presPerDay // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      carName: freezed == carName
          ? _value.carName
          : carName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestionsModelImpl implements _SuggestionsModel {
  const _$SuggestionsModelImpl(
      {this.id,
      this.title,
      this.carId,
      this.presPerDay,
      this.category,
      this.isActive,
      this.createdAt,
      this.carName});

  factory _$SuggestionsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuggestionsModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final int? carId;
  @override
  final double? presPerDay;
  @override
  final String? category;
  @override
  final bool? isActive;
  @override
  final String? createdAt;
  @override
  final String? carName;

  @override
  String toString() {
    return 'SuggestionsModel(id: $id, title: $title, carId: $carId, presPerDay: $presPerDay, category: $category, isActive: $isActive, createdAt: $createdAt, carName: $carName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionsModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.carId, carId) || other.carId == carId) &&
            (identical(other.presPerDay, presPerDay) ||
                other.presPerDay == presPerDay) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.carName, carName) || other.carName == carName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, carId, presPerDay,
      category, isActive, createdAt, carName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionsModelImplCopyWith<_$SuggestionsModelImpl> get copyWith =>
      __$$SuggestionsModelImplCopyWithImpl<_$SuggestionsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestionsModelImplToJson(
      this,
    );
  }
}

abstract class _SuggestionsModel implements SuggestionsModel {
  const factory _SuggestionsModel(
      {final int? id,
      final String? title,
      final int? carId,
      final double? presPerDay,
      final String? category,
      final bool? isActive,
      final String? createdAt,
      final String? carName}) = _$SuggestionsModelImpl;

  factory _SuggestionsModel.fromJson(Map<String, dynamic> json) =
      _$SuggestionsModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  int? get carId;
  @override
  double? get presPerDay;
  @override
  String? get category;
  @override
  bool? get isActive;
  @override
  String? get createdAt;
  @override
  String? get carName;
  @override
  @JsonKey(ignore: true)
  _$$SuggestionsModelImplCopyWith<_$SuggestionsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
