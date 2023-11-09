part of 'sensor_three_cubit.dart';

class SensorThreeState {
  final String errorMessage;
  final int? averageTemp;
  final int? averageHumidity;
  final int? averageNoise;
  final int? currentTemp;
  final int? currentHumidity;
  final int? currentNoise;
  bool isCorrect;
  bool isCorrect2;
  bool isCorrect3;

  final List<SensorModel> sensorThreeModels;

  SensorThreeState({
    required this.errorMessage,
    required this.averageTemp,
    required this.averageHumidity,
    required this.averageNoise,
    required this.currentTemp,
    required this.currentHumidity,
    required this.currentNoise,
    required this.sensorThreeModels,
    required this.isCorrect,
    required this.isCorrect2,
    required this.isCorrect3,
  });
}
