import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:microclimat_monitoring_app/core.dart';
import 'package:microclimat_monitoring_app/models/humidity_model.dart';
import 'package:microclimat_monitoring_app/repositories/humi_repository.dart';

part 'humidity_data_state.dart';

class HumidityDataCubit extends Cubit<HumidityDataState> {
  HumidityDataCubit(this._humidityRepository)
      : super(
          const HumidityDataState(
            errorMessage: '',
            status: Status.initial,
            averageHumidity: null,
            currentHumidity: null,
            humidityModel: [],
          ),
        );

  StreamSubscription? _streamSubscription;

  final HumidityRepository _humidityRepository;

  Future<void> humidityData() async {
    _streamSubscription = _humidityRepository.getHumidityDataModel().listen(
      (dataModels) {
        try {
          emit(
            HumidityDataState(
              errorMessage: '',
              status: Status.isPressed,
              humidityModel: dataModels,
              averageHumidity: null,
              currentHumidity: null,
            ),
          );
        } catch (error) {
          emit(const HumidityDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            humidityModel: [],
            averageHumidity: null,
            currentHumidity: null,
          ));
        }
        int? currentValue;
        int sumValue = 0;
        int? averageValue;
        for (final datamodel in state.humidityModel) {
          sumValue += datamodel.humidity;
          currentValue = datamodel.humidity;

          averageValue = (sumValue ~/ state.humidityModel.length).toInt();
        }
        if (currentValue != null) {
          if (currentValue > 25 || currentValue < 10) {
            emit(
              HumidityDataState(
                  errorMessage: '',
                  status: Status.success,
                  humidityModel: dataModels,
                  averageHumidity: averageValue,
                  currentHumidity: currentValue,
                  colorBox: Colors.red),
            );
          }
        }
      },
    );
  }

  Future<void> humidityData2() async {
    _streamSubscription = _humidityRepository.getHumidityDataModel2().listen(
      (dataModels) {
        try {
          emit(
            HumidityDataState(
              errorMessage: '',
              status: Status.isPressed,
              humidityModel: dataModels,
              averageHumidity: null,
              currentHumidity: null,
            ),
          );
        } catch (error) {
          emit(const HumidityDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            humidityModel: [],
            averageHumidity: null,
            currentHumidity: null,
          ));
        }
        int? currentValue;
        int sumValue = 0;
        int? averageValue;
        for (final datamodel in state.humidityModel) {
          sumValue += datamodel.humidity;
          currentValue = datamodel.humidity;

          averageValue = (sumValue ~/ state.humidityModel.length).toInt();
        }
        emit(
          HumidityDataState(
            errorMessage: '',
            status: Status.success,
            humidityModel: dataModels,
            averageHumidity: averageValue,
            currentHumidity: currentValue,
          ),
        );
        if (currentValue != null) {
          if (currentValue > 25 || currentValue < 10) {
            emit(
              HumidityDataState(
                  errorMessage: '',
                  status: Status.success,
                  humidityModel: dataModels,
                  averageHumidity: averageValue,
                  currentHumidity: currentValue,
                  colorBox: Colors.red),
            );
          }
        }
      },
    );
  }

  Future<void> humidityData3() async {
    _streamSubscription = _humidityRepository.getHumidityDataModel3().listen(
      (dataModels) {
        try {
          emit(
            HumidityDataState(
              errorMessage: '',
              status: Status.isPressed,
              humidityModel: dataModels,
              averageHumidity: null,
              currentHumidity: null,
            ),
          );
        } catch (error) {
          emit(const HumidityDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            humidityModel: [],
            averageHumidity: null,
            currentHumidity: null,
          ));
        }
        int? currentValue;
        int sumValue = 0;
        int? averageValue;
        for (final datamodel in state.humidityModel) {
          sumValue += datamodel.humidity;
          currentValue = datamodel.humidity;

          averageValue = (sumValue ~/ state.humidityModel.length).toInt();
        }
        emit(
          HumidityDataState(
            errorMessage: '',
            status: Status.success,
            humidityModel: dataModels,
            averageHumidity: averageValue,
            currentHumidity: currentValue,
          ),
        );
        if (currentValue != null) {
          if (currentValue > 25 || currentValue < 10) {
            emit(
              HumidityDataState(
                  errorMessage: '',
                  status: Status.success,
                  humidityModel: dataModels,
                  averageHumidity: averageValue,
                  currentHumidity: currentValue,
                  colorBox: Colors.red),
            );
          }
        }
      },
    );
  }

  Future<void> humidityData4() async {
    _streamSubscription = _humidityRepository.getHumidityDataModel4().listen(
      (dataModels) {
        try {
          emit(
            HumidityDataState(
              errorMessage: '',
              status: Status.isPressed,
              humidityModel: dataModels,
              averageHumidity: null,
              currentHumidity: null,
            ),
          );
        } catch (error) {
          emit(const HumidityDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            humidityModel: [],
            averageHumidity: null,
            currentHumidity: null,
          ));
        }
        int? currentValue;
        int sumValue = 0;
        int? averageValue;
        for (final datamodel in state.humidityModel) {
          sumValue += datamodel.humidity;
          currentValue = datamodel.humidity;

          averageValue = (sumValue ~/ state.humidityModel.length).toInt();
        }
        emit(
          HumidityDataState(
            errorMessage: '',
            status: Status.success,
            humidityModel: dataModels,
            averageHumidity: averageValue,
            currentHumidity: currentValue,
          ),
        );
        if (currentValue != null) {
          if (currentValue > 25 || currentValue < 10) {
            emit(
              HumidityDataState(
                  errorMessage: '',
                  status: Status.success,
                  humidityModel: dataModels,
                  averageHumidity: averageValue,
                  currentHumidity: currentValue,
                  colorBox: Colors.red),
            );
          }
        }
      },
    );
  }

  Future<void> humidityData5() async {
    _streamSubscription = _humidityRepository.getHumidityDataModel5().listen(
      (dataModels) {
        try {
          emit(
            HumidityDataState(
              errorMessage: '',
              status: Status.isPressed,
              humidityModel: dataModels,
              averageHumidity: null,
              currentHumidity: null,
            ),
          );
        } catch (error) {
          emit(const HumidityDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            humidityModel: [],
            averageHumidity: null,
            currentHumidity: null,
          ));
        }
        int? currentValue;
        int sumValue = 0;
        int? averageValue;
        for (final datamodel in state.humidityModel) {
          sumValue += datamodel.humidity;
          currentValue = datamodel.humidity;

          averageValue = (sumValue ~/ state.humidityModel.length).toInt();
        }
        emit(
          HumidityDataState(
            errorMessage: '',
            status: Status.success,
            humidityModel: dataModels,
            averageHumidity: averageValue,
            currentHumidity: currentValue,
          ),
        );
        if (currentValue != null) {
          if (currentValue > 25 || currentValue < 10) {
            emit(
              HumidityDataState(
                  errorMessage: '',
                  status: Status.success,
                  humidityModel: dataModels,
                  averageHumidity: averageValue,
                  currentHumidity: currentValue,
                  colorBox: Colors.red),
            );
          }
        }
      },
    );
  }

  Future<void> generateHumidity() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int a = 1; a <= 10; a++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _humidityRepository.addHumidity(hour: a, humidity: randomInt);
    }
  }

  Future<void> generateHumidity2() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int a = 1; a <= 10; a++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _humidityRepository.addHumidity2(hour: a, humidity: randomInt);
    }
  }

  Future<void> generateHumidity3() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int a = 1; a <= 10; a++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _humidityRepository.addHumidity3(hour: a, humidity: randomInt);
    }
  }

  Future<void> generateHumidity4() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int a = 1; a <= 10; a++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _humidityRepository.addHumidity4(hour: a, humidity: randomInt);
    }
  }

  Future<void> generateHumidity5() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int a = 1; a <= 10; a++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _humidityRepository.addHumidity5(hour: a, humidity: randomInt);
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
