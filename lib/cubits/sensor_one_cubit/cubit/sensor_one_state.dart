part of 'sensor_one_cubit.dart';

@freezed
class SensorOneState with _$SensorOneState {
  factory SensorOneState({
    required String errorMessage,
    required int? averageTemp,
    required int? averageHumidity,
    required int? averageNoise,
    required int? currentTemp,
    required int? currentHumidity,
    required int? currentNoise,
    required bool isCorrect,
    required bool isCorrect2,
    required bool isCorrect3,
    required List<SensorModel> sensorOneModels,
  }) = _SensorOneState;
}
