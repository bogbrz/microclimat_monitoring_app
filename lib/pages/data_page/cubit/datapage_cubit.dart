import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:microclimat_monitoring_app/datamodel.dart';
import 'package:microclimat_monitoring_app/repository.dart';

part 'datapage_state.dart';

class DatapageCubit extends Cubit<DatapageState> {
  DatapageCubit(this._repository)
      : super(const DatapageState(
            isLoading: false, errorMessage: '', dataModels: []));
  StreamSubscription? _streamSubscription;
  final Repository _repository;

  Future<void> start() async {
    _streamSubscription = _repository.getDataModelStream().listen(
      (dataModels) {
        if (dataModels.isEmpty) {
          emit(DatapageState(
              errorMessage: 'Missing data',
              isLoading: false,
              dataModels: dataModels));
        }
        emit(
          DatapageState(
            errorMessage: '',
            isLoading: false,
            dataModels: dataModels,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
