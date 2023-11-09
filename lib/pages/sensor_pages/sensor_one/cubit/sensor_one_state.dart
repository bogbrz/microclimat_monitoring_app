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
  // final String errorMessage;
  // final int? averageTemp;
  // final int? averageHumidity;
  // final int? averageNoise;
  // final int? currentTemp;
  // final int? currentHumidity;
  // final int? currentNoise;
  // bool isCorrect;
  // bool isCorrect2;
  // bool isCorrect3;

  // final List<SensorModel> sensorOneModels;

  // SensorOneState({
  //   required this.errorMessage,
  //   required this.averageTemp,
  //   required this.averageHumidity,
  //   required this.averageNoise,
  //   required this.currentTemp,
  //   required this.currentHumidity,
  //   required this.currentNoise,
  //   required this.sensorOneModels,
  //   required this.isCorrect,
  //   required this.isCorrect2,
  //   required this.isCorrect3,
  // });
}
