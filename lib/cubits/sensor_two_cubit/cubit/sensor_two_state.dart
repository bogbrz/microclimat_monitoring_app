part of 'sensor_two_cubit.dart';

@freezed
class SensorTwoState with _$SensorTwoState {
  factory SensorTwoState({
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
    required List<SensorModel> sensorTwoModels,
  }) = _SensorTwoState;
}
