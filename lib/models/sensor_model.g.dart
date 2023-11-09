// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sensor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SensorModelImpl _$$SensorModelImplFromJson(Map<String, dynamic> json) =>
    _$SensorModelImpl(
      json['hour'] as int,
      json['temp'] as int,
      json['noise'] as int,
      json['humidity'] as int,
    );

Map<String, dynamic> _$$SensorModelImplToJson(_$SensorModelImpl instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'temp': instance.temp,
      'noise': instance.noise,
      'humidity': instance.humidity,
    };
