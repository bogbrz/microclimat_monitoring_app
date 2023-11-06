part of 'temp_data_cubit.dart';

class TempDataState {
  final String errorMessage;
  final Status status;
  final List<TempModel> tempModels;
  final int? averagetemp;
  final int? currentTemp;
  final Color colorBox;

  const TempDataState({
    required this.errorMessage,
    required this.status,
    required this.tempModels,
    required this.averagetemp,
    required this.currentTemp,
    this.colorBox = Colors.green,
  });
}
