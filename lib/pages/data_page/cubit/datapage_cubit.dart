import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:microclimat_monitoring_app/core.dart';
import 'package:microclimat_monitoring_app/datamodel.dart';
import 'package:microclimat_monitoring_app/repositories/humi_repository.dart';
import 'package:microclimat_monitoring_app/repositories/nosie_repository.dart';
import 'package:microclimat_monitoring_app/repositories/temp_repository.dart';

part 'datapage_state.dart';

class DatapageCubit extends Cubit<DatapageState> {
  DatapageCubit(
      this._tempRepository, this._humidityRepository, this._noiseRepository)
      : super(const DatapageState(
            status: Status.loading, errorMessage: '', dataModels: []));
  StreamSubscription? _streamSubscription;
  final TempRepository _tempRepository;
  final HumidityRepository _humidityRepository;
  final NoiseRepository _noiseRepository;

  Future<void> tempData() async {
    _streamSubscription = _tempRepository.getTempDataModel().listen(
      (dataModels) {
        emit(const DatapageState(
            errorMessage: '', status: Status.loading, dataModels: []));
        if (dataModels.isEmpty) {
          emit(const DatapageState(
              errorMessage: 'Missing data',
              status: Status.error,
              dataModels: []));
        }
        emit(
          DatapageState(
            errorMessage: '',
            status: Status.success,
            dataModels: dataModels,
          ),
        );
      },
    );
  }

  Future<void> humidityData() async {
    _streamSubscription = _humidityRepository.getHumidityDataModel().listen(
      (dataModels) {
        emit(const DatapageState(
            errorMessage: '', status: Status.loading, dataModels: []));
        if (dataModels.isEmpty) {
          emit(const DatapageState(
              errorMessage: 'Missing data',
              status: Status.error,
              dataModels: []));
        }
        emit(
          DatapageState(
            errorMessage: '',
            status: Status.success,
            dataModels: dataModels,
          ),
        );
      },
    );
  }

  Future<void> noiseData() async {
    _streamSubscription = _noiseRepository.getNoiseDataModel().listen(
      (dataModels) {
        emit(const DatapageState(
            errorMessage: '', status: Status.loading, dataModels: []));
        if (dataModels.isEmpty) {
          emit(const DatapageState(
              errorMessage: 'Missing data',
              status: Status.error,
              dataModels: []));
        }
        emit(
          DatapageState(
            errorMessage: '',
            status: Status.success,
            dataModels: dataModels,
          ),
        );
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

  Future<void> generateHumidity() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int a = 1; a <= 10; a++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _humidityRepository.addHumidity(hour: a, humidity: randomInt);
    }
  }

  Future<void> generateNoise() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int c = 1; c <= 10; c++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _noiseRepository.addNoise(hour: c, noise: randomInt);
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
