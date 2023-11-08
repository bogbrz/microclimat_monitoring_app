part of 'sensor_four_cubit.dart';

class SensorFourState {
  final String errorMessage;
  final int? averageTemp;
  final int? averageHumidity;
  final int? averageNoise;
  final int? currentTemp;
  final int? currentHumidity;
  final int? currentNoise;
  Color buttonColor1;
  Color buttonColor2;
  Color buttonColor3;

  final List<SensorModel> sensorFourModels;

  SensorFourState({
    required this.errorMessage,
    required this.averageTemp,
    required this.averageHumidity,
    required this.averageNoise,
    required this.currentTemp,
    required this.currentHumidity,
    required this.currentNoise,
    required this.sensorFourModels,
    this.buttonColor1 = Colors.green,
    this.buttonColor2 = Colors.green,
    this.buttonColor3 = Colors.green,
  });
}
