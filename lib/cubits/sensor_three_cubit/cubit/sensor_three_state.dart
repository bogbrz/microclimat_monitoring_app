part of 'sensor_three_cubit.dart';
@freezed
class SensorThreeState with _$SensorThreeState {
  factory SensorThreeState({
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
    required List<SensorModel> sensorThreeModels,
  }) = _SensorThreeState;

}
