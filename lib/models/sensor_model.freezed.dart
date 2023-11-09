// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sensor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SensorModel {
  int get hour => throw _privateConstructorUsedError;
  int get temp => throw _privateConstructorUsedError;
  int get noise => throw _privateConstructorUsedError;
  int get humidity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SensorModelCopyWith<SensorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SensorModelCopyWith<$Res> {
  factory $SensorModelCopyWith(
          SensorModel value, $Res Function(SensorModel) then) =
      _$SensorModelCopyWithImpl<$Res, SensorModel>;
  @useResult
  $Res call({int hour, int temp, int noise, int humidity});
}

/// @nodoc
class _$SensorModelCopyWithImpl<$Res, $Val extends SensorModel>
    implements $SensorModelCopyWith<$Res> {
  _$SensorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? temp = null,
    Object? noise = null,
    Object? humidity = null,
  }) {
    return _then(_value.copyWith(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as int,
      noise: null == noise
          ? _value.noise
          : noise // ignore: cast_nullable_to_non_nullable
              as int,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SensorModelImplCopyWith<$Res>
    implements $SensorModelCopyWith<$Res> {
  factory _$$SensorModelImplCopyWith(
          _$SensorModelImpl value, $Res Function(_$SensorModelImpl) then) =
      __$$SensorModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int temp, int noise, int humidity});
}

/// @nodoc
class __$$SensorModelImplCopyWithImpl<$Res>
    extends _$SensorModelCopyWithImpl<$Res, _$SensorModelImpl>
    implements _$$SensorModelImplCopyWith<$Res> {
  __$$SensorModelImplCopyWithImpl(
      _$SensorModelImpl _value, $Res Function(_$SensorModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? temp = null,
    Object? noise = null,
    Object? humidity = null,
  }) {
    return _then(_$SensorModelImpl(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as int,
      noise: null == noise
          ? _value.noise
          : noise // ignore: cast_nullable_to_non_nullable
              as int,
      humidity: null == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SensorModelImpl implements _SensorModel {
  _$SensorModelImpl(
      {required this.hour,
      required this.temp,
      required this.noise,
      required this.humidity});

  @override
  final int hour;
  @override
  final int temp;
  @override
  final int noise;
  @override
  final int humidity;

  @override
  String toString() {
    return 'SensorModel(hour: $hour, temp: $temp, noise: $noise, humidity: $humidity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SensorModelImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.noise, noise) || other.noise == noise) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hour, temp, noise, humidity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SensorModelImplCopyWith<_$SensorModelImpl> get copyWith =>
      __$$SensorModelImplCopyWithImpl<_$SensorModelImpl>(this, _$identity);
}

abstract class _SensorModel implements SensorModel {
  factory _SensorModel(
      {required final int hour,
      required final int temp,
      required final int noise,
      required final int humidity}) = _$SensorModelImpl;

  @override
  int get hour;
  @override
  int get temp;
  @override
  int get noise;
  @override
  int get humidity;
  @override
  @JsonKey(ignore: true)
  _$$SensorModelImplCopyWith<_$SensorModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
