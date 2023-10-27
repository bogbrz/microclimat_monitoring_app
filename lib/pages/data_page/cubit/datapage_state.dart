part of 'datapage_cubit.dart';

@immutable
class DatapageState {
  final String errorMessage;
  final Status status;
  final List<DataModel> dataModels;

  const DatapageState(
      {required this.errorMessage,
      required this.status,
      required this.dataModels});
}
