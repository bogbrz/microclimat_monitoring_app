part of 'datapage_cubit.dart';

@immutable
class DatapageState {
  final String errorMessage;
  final Status status;
  final List<DataModel> dataModels;
  final int? averageValue;
  final int? currentValue;

  const DatapageState({
    required this.errorMessage,
    required this.status,
    required this.dataModels,
    required this.averageValue,
    required this.currentValue,
  });
}
