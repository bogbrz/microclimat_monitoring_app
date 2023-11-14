import 'package:freezed_annotation/freezed_annotation.dart';
part 'sensor_model.freezed.dart';

@freezed
class SensorModel with _$SensorModel {
  factory SensorModel({
    required int hour,
    required int temp,
    required int noise,
    required int humidity,
    required int sensorId,
  }) = _SensorModel;
}
