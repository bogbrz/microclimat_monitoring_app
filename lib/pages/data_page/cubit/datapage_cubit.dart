import 'dart:async';
import 'dart:math';

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

  Future<void> loop() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int i = 1; i <= 48; i++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _repository.add(day: i, temp: randomInt);
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
