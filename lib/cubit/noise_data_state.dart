part of 'noise_data_cubit.dart';

class NoiseDataState {
  final String errorMessage;
  final Status status;
  final List<NoiseModel> noiseModels;
  final int? averageNoise;
  final int? currentNoise;
  final Color colorBox;

  const NoiseDataState({
    required this.errorMessage,
    required this.status,
    required this.noiseModels,
    required this.averageNoise,
    required this.currentNoise,
    this.colorBox = Colors.green,
  });
}
