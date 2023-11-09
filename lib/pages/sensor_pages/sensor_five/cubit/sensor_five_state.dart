part of 'sensor_five_cubit.dart';


class SensorFiveState {
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

  final List<SensorModel> sensorFiveModels;

  SensorFiveState({
    required this.errorMessage,
    required this.averageTemp,
    required this.averageHumidity,
    required this.averageNoise,
    required this.currentTemp,
    required this.currentHumidity,
    required this.currentNoise,
    required this.sensorFiveModels,
  required this.isCorrect,
    required this.isCorrect2,
    required this.isCorrect3,
  });
}
