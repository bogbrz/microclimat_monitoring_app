part of 'sensor_four_cubit.dart';
@freezed
class SensorFourState with _$SensorFourState {
  factory SensorFourState({
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
    required List<SensorModel> sensorFourModels,
  }) = _SensorFourState;

}
