import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:microclimat_monitoring_app/core.dart';
import 'package:microclimat_monitoring_app/models/noise_model.dart';
import 'package:microclimat_monitoring_app/repositories/nosie_repository.dart';

part 'noise_data_state.dart';

class NoiseDataCubit extends Cubit<NoiseDataState> {
  NoiseDataCubit(this._noiseRepository)
      : super(const NoiseDataState(
            errorMessage: '',
            status: Status.initial,
            noiseModels: [],
            averageNoise: null,
            currentNoise: null));

  StreamSubscription? _streamSubscription;

  final NoiseRepository _noiseRepository;
  Future<void> noiseData() async {
    _streamSubscription = _noiseRepository.getNoiseDataModel().listen(
      (dataModels) {
        try {
          emit(
            NoiseDataState(
              errorMessage: '',
              status: Status.success,
              noiseModels: dataModels,
              averageNoise: null,
              currentNoise: null,
            ),
          );
        } catch (error) {
          emit(const NoiseDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            noiseModels: [],
            averageNoise: null,
            currentNoise: null,
          ));
        }
        int? currentValue;
        int sumValue = 0;
        int? averageValue;
        for (final datamodel in state.noiseModels) {
          sumValue += datamodel.noise;
          currentValue = datamodel.noise;

          averageValue = (sumValue ~/ state.noiseModels.length).toInt();
        }
        emit(
          NoiseDataState(
            errorMessage: '',
            status: Status.success,
            noiseModels: dataModels,
            averageNoise: averageValue,
            currentNoise: currentValue,
          ),
        );
      },
    );
  }

  Future<void> noiseData2() async {
    _streamSubscription = _noiseRepository.getNoiseDataModel2().listen(
      (dataModels) {
        try {
          emit(
            NoiseDataState(
              errorMessage: '',
              status: Status.success,
              noiseModels: dataModels,
              averageNoise: null,
              currentNoise: null,
            ),
          );
        } catch (error) {
          emit(const NoiseDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            noiseModels: [],
            averageNoise: null,
            currentNoise: null,
          ));
        }
        int? currentValue;
        int sumValue = 0;
        int? averageValue;
        for (final datamodel in state.noiseModels) {
          sumValue += datamodel.noise;
          currentValue = datamodel.noise;

          averageValue = (sumValue ~/ state.noiseModels.length).toInt();
        }
        emit(
          NoiseDataState(
            errorMessage: '',
            status: Status.success,
            noiseModels: dataModels,
            averageNoise: averageValue,
            currentNoise: currentValue,
          ),
        );
      },
    );
  }

  Future<void> noiseData3() async {
    _streamSubscription = _noiseRepository.getNoiseDataModel3().listen(
      (dataModels) {
        try {
          emit(
            NoiseDataState(
              errorMessage: '',
              status: Status.success,
              noiseModels: dataModels,
              averageNoise: null,
              currentNoise: null,
            ),
          );
        } catch (error) {
          emit(const NoiseDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            noiseModels: [],
            averageNoise: null,
            currentNoise: null,
          ));
        }
        int? currentValue;
        int sumValue = 0;
        int? averageValue;
        for (final datamodel in state.noiseModels) {
          sumValue += datamodel.noise;
          currentValue = datamodel.noise;

          averageValue = (sumValue ~/ state.noiseModels.length).toInt();
        }
        emit(
          NoiseDataState(
            errorMessage: '',
            status: Status.success,
            noiseModels: dataModels,
            averageNoise: averageValue,
            currentNoise: currentValue,
          ),
        );
      },
    );
  }

  Future<void> noiseData4() async {
    _streamSubscription = _noiseRepository.getNoiseDataModel4().listen(
      (dataModels) {
        try {
          emit(
            NoiseDataState(
              errorMessage: '',
              status: Status.success,
              noiseModels: dataModels,
              averageNoise: null,
              currentNoise: null,
            ),
          );
        } catch (error) {
          emit(const NoiseDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            noiseModels: [],
            averageNoise: null,
            currentNoise: null,
          ));
        }
        int? currentValue;
        int sumValue = 0;
        int? averageValue;
        for (final datamodel in state.noiseModels) {
          sumValue += datamodel.noise;
          currentValue = datamodel.noise;

          averageValue = (sumValue ~/ state.noiseModels.length).toInt();
        }
        emit(
          NoiseDataState(
            errorMessage: '',
            status: Status.success,
            noiseModels: dataModels,
            averageNoise: averageValue,
            currentNoise: currentValue,
          ),
        );
      },
    );
  }

  Future<void> noiseData5() async {
    _streamSubscription = _noiseRepository.getNoiseDataModel5().listen(
      (dataModels) {
        try {
          emit(
            NoiseDataState(
              errorMessage: '',
              status: Status.success,
              noiseModels: dataModels,
              averageNoise: null,
              currentNoise: null,
            ),
          );
        } catch (error) {
          emit(const NoiseDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            noiseModels: [],
            averageNoise: null,
            currentNoise: null,
          ));
        }
        int? currentValue;
        int sumValue = 0;
        int? averageValue;
        for (final datamodel in state.noiseModels) {
          sumValue += datamodel.noise;
          currentValue = datamodel.noise;

          averageValue = (sumValue ~/ state.noiseModels.length).toInt();
        }
        emit(
          NoiseDataState(
            errorMessage: '',
            status: Status.success,
            noiseModels: dataModels,
            averageNoise: averageValue,
            currentNoise: currentValue,
          ),
        );
      },
    );
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

  Future<void> generateNoise2() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int c = 1; c <= 10; c++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _noiseRepository.addNoise2(hour: c, noise: randomInt);
    }
  }

  Future<void> generateNoise3() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int c = 1; c <= 10; c++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _noiseRepository.addNoise3(hour: c, noise: randomInt);
    }
  }

  Future<void> generateNoise4() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int c = 1; c <= 10; c++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _noiseRepository.addNoise4(hour: c, noise: randomInt);
    }
  }

  Future<void> generateNoise5() async {
    int min = 5;
    int max = 35;
    Random random = Random();
    for (int c = 1; c <= 10; c++) {
      int randomInt = min + random.nextInt(max - min + 1);

      _noiseRepository.addNoise5(hour: c, noise: randomInt);
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
