import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:microclimat_monitoring_app/core.dart';
import 'package:microclimat_monitoring_app/models/temp_model.dart';
import 'package:microclimat_monitoring_app/repositories/temp_repository.dart';

part 'temp_data_state.dart';

class TempDataCubit extends Cubit<TempDataState> {
  TempDataCubit(
    this._tempRepository,
  ) : super(const TempDataState(
          status: Status.loading,
          errorMessage: '',
          tempModels: [],
          averagetemp: null,
          currentTemp: null,
        ));
  StreamSubscription? _streamSubscription;
  final TempRepository _tempRepository;

  Future<void> tempData() async {
    _streamSubscription = _tempRepository.getTempDataModel().listen(
      (dataModels) {
        try {
          emit(
            TempDataState(
              errorMessage: '',
              status: Status.isPressed,
              tempModels: dataModels,
              averagetemp: null,
              currentTemp: null,
            ),
          );
        } catch (error) {
          emit(const TempDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            tempModels: [],
            averagetemp: null,
            currentTemp: null,
          ));
        }
        int? currentValue;
        int sumValue = 0;
        int? averageValue;
        for (final datamodel in state.tempModels) {
          sumValue += datamodel.temp;
          currentValue = datamodel.temp;

          averageValue = (sumValue ~/ state.tempModels.length).toInt();
        }
        emit(
          TempDataState(
            errorMessage: '',
            status: Status.success,
            tempModels: dataModels,
            averagetemp: averageValue,
            currentTemp: currentValue,
          ),
        );
        if (currentValue != null) {
          if (currentValue > 25 || currentValue < 10) {
            emit(
              TempDataState(
                  errorMessage: '',
                  status: Status.success,
                  tempModels: dataModels,
                  averagetemp: averageValue,
                  currentTemp: currentValue,
                  colorBox: Colors.red),
            );
          }
        }
      },
    );
  }

  Future<void> tempData2() async {
    _streamSubscription = _tempRepository.getTempDataModel2().listen(
      (dataModels) {
        try {
          emit(
            TempDataState(
              errorMessage: '',
              status: Status.isPressed,
              tempModels: dataModels,
              averagetemp: null,
              currentTemp: null,
            ),
          );
        } catch (error) {
          emit(const TempDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            tempModels: [],
            averagetemp: null,
            currentTemp: null,
          ));
        }
        int? currentValue;
        int sumValue = 0;
        int? averageValue;
        for (final datamodel in state.tempModels) {
          sumValue += datamodel.temp;
          currentValue = datamodel.temp;

          averageValue = (sumValue ~/ state.tempModels.length).toInt();
        }
        emit(
          TempDataState(
            errorMessage: '',
            status: Status.success,
            tempModels: dataModels,
            averagetemp: averageValue,
            currentTemp: currentValue,
          ),
        );
        if (currentValue != null) {
          if (currentValue > 25 || currentValue < 10) {
            emit(
              TempDataState(
                  errorMessage: '',
                  status: Status.success,
                  tempModels: dataModels,
                  averagetemp: averageValue,
                  currentTemp: currentValue,
                  colorBox: Colors.red),
            );
          }
        }
      },
    );
  }

  Future<void> tempData3() async {
    _streamSubscription = _tempRepository.getTempDataModel3().listen(
      (dataModels) {
        try {
          emit(
            TempDataState(
              errorMessage: '',
              status: Status.isPressed,
              tempModels: dataModels,
              averagetemp: null,
              currentTemp: null,
            ),
          );
        } catch (error) {
          emit(const TempDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            tempModels: [],
            averagetemp: null,
            currentTemp: null,
          ));
        }
        int? currentValue;
        int sumValue = 0;
        int? averageValue;
        for (final datamodel in state.tempModels) {
          sumValue += datamodel.temp;
          currentValue = datamodel.temp;

          averageValue = (sumValue ~/ state.tempModels.length).toInt();
        }
        emit(
          TempDataState(
            errorMessage: '',
            status: Status.success,
            tempModels: dataModels,
            averagetemp: averageValue,
            currentTemp: currentValue,
          ),
        );
        if (currentValue != null) {
          if (currentValue > 25 || currentValue < 10) {
            emit(
              TempDataState(
                  errorMessage: '',
                  status: Status.success,
                  tempModels: dataModels,
                  averagetemp: averageValue,
                  currentTemp: currentValue,
                  colorBox: Colors.red),
            );
          }
        }
      },
    );
  }

  Future<void> tempData4() async {
    _streamSubscription = _tempRepository.getTempDataModel4().listen(
      (dataModels) {
        try {
          emit(
            TempDataState(
              errorMessage: '',
              status: Status.isPressed,
              tempModels: dataModels,
              averagetemp: null,
              currentTemp: null,
            ),
          );
        } catch (error) {
          emit(const TempDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            tempModels: [],
            averagetemp: null,
            currentTemp: null,
          ));
        }
        int? currentValue;
        int sumValue = 0;
        int? averageValue;
        for (final datamodel in state.tempModels) {
          sumValue += datamodel.temp;
          currentValue = datamodel.temp;

          averageValue = (sumValue ~/ state.tempModels.length).toInt();
        }
        emit(
          TempDataState(
            errorMessage: '',
            status: Status.success,
            tempModels: dataModels,
            averagetemp: averageValue,
            currentTemp: currentValue,
          ),
        );
        if (currentValue != null) {
          if (currentValue > 25 || currentValue < 10) {
            emit(
              TempDataState(
                  errorMessage: '',
                  status: Status.success,
                  tempModels: dataModels,
                  averagetemp: averageValue,
                  currentTemp: currentValue,
                  colorBox: Colors.red),
            );
          }
        }
      },
    );
  }

  Future<void> tempData5() async {
    _streamSubscription = _tempRepository.getTempDataModel5().listen(
      (dataModels) {
        try {
          emit(
            TempDataState(
              errorMessage: '',
              status: Status.isPressed,
              tempModels: dataModels,
              averagetemp: null,
              currentTemp: null,
            ),
          );
        } catch (error) {
          emit(const TempDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            tempModels: [],
            averagetemp: null,
            currentTemp: null,
          ));
        }
        int? currentValue;
        int sumValue = 0;
        int? averageValue;
        for (final datamodel in state.tempModels) {
          sumValue += datamodel.temp;
          currentValue = datamodel.temp;

          averageValue = (sumValue ~/ state.tempModels.length).toInt();
        }
        emit(
          TempDataState(
            errorMessage: '',
            status: Status.success,
            tempModels: dataModels,
            averagetemp: averageValue,
            currentTemp: currentValue,
          ),
        );
        if (currentValue != null) {
          if (currentValue > 25 || currentValue < 10) {
            emit(
              TempDataState(
                  errorMessage: '',
                  status: Status.success,
                  tempModels: dataModels,
                  averagetemp: averageValue,
                  currentTemp: currentValue,
                  colorBox: Colors.red),
            );
          }
        }
      },
    );
  }

  Future<void> generateTemp() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int b = 1; b <= 10; b++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _tempRepository.addTemp(hour: b, temp: randomInt);
    }
  }

  Future<void> generateTemp2() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int b = 1; b <= 10; b++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _tempRepository.addTemp2(hour: b, temp: randomInt);
    }
  }

  Future<void> generateTemp3() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int b = 1; b <= 10; b++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _tempRepository.addTemp3(hour: b, temp: randomInt);
    }
  }

  Future<void> generateTemp4() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int b = 1; b <= 10; b++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _tempRepository.addTemp4(hour: b, temp: randomInt);
    }
  }

  Future<void> generateTemp5() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int b = 1; b <= 10; b++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _tempRepository.addTemp5(hour: b, temp: randomInt);
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
