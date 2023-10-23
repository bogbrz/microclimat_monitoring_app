part of 'datapage_cubit.dart';

@immutable
class DatapageState {
  final String errorMessage;
  final bool isLoading;
  final List<DataModel> dataModels;

  const DatapageState(
      {required this.errorMessage,
      required this.isLoading,
      required this.dataModels});
}
