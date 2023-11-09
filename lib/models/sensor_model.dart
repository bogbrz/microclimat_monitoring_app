import 'package:freezed_annotation/freezed_annotation.dart';

part 'sensor_model.g.dart';
part 'sensor_model.freezed.dart';

@freezed
class SensorModel with _$SensorModel {
  factory SensorModel(
    int hour,
    int temp,
    int noise,
    int humidity,
  ) = _SensorModel;

  factory SensorModel.fromJson(Map<String, dynamic> json) =>
      _$SensorModelFromJson(json);

 
}
