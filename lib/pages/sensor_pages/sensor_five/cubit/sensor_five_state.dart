part of 'sensor_five_cubit.dart';

@freezed
class SensorFiveState with _$SensorFiveState {
  factory SensorFiveState({
    required String errorMessage,
    required int averageTemp,
    required int averageHumidity,
    required int averageNoise,
    required int currentTemp,
    required int currentHumidity,
    required int currentNoise,
    required List<SensorModel> sensorFiveModels,
    required bool isCorrect,
    required bool isCorrect2,
    required bool isCorrect3,
  }) = _$SensroFiveState;
}
