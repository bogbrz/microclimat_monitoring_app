import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'package:microclimat_monitoring_app/data_source/remote_data_source.dart';
import 'package:microclimat_monitoring_app/datamodel.dart';

part 'datapage_state.dart';

class DatapageCubit extends Cubit<DatapageState> {
  DatapageCubit(this._repository)
      : super(const DatapageState(
            isLoading: false, errorMessage: '', dataModels: []));
  StreamSubscription? _streamSubscription;
  final RemoteData _repository;

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

  Future<void> add(int day, int temp) async {
    await _repository.add(temp: temp, day: day);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
