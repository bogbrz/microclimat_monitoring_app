import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:microclimat_monitoring_app/datamodel.dart';
import 'package:microclimat_monitoring_app/repositories/repository.dart';

part 'datapage_state.dart';

class DatapageCubit extends Cubit<DatapageState> {
  DatapageCubit(this._repository)
      : super(const DatapageState(
            isLoading: false, errorMessage: '', dataModels: []));
  StreamSubscription? _streamSubscription;
  final Repository _repository;

  Future<void> start() async {
    _streamSubscription = _repository.getDataModel().listen(
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

  Future<void> add({required int day, required int temp}) async {
    await _repository.add(temp, day);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
