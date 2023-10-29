part of 'humidity_data_cubit.dart';

class HumidityDataState {
  final String errorMessage;
  final Status status;
  final List<HumidityModel> humidityModel;
  final int? averageHumidity;
  final int? currentHumidity;

  const HumidityDataState({
    required this.errorMessage,
    required this.status,
    required this.humidityModel,
    required this.averageHumidity,
    required this.currentHumidity,
  });
}
