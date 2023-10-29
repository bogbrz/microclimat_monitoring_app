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
    int currentValue = 0;
    int sumValue = 0;
    int averageValue = 0;
    for (final datamodel in state.noiseModels) {
      currentValue = datamodel.noise;
      sumValue += datamodel.noise;
      averageValue = (sumValue ~/ state.noiseModels.length).toInt();
    }
    _streamSubscription = _noiseRepository.getNoiseDataModel().listen(
      (dataModels) {
        if (dataModels.isEmpty) {
          emit(const NoiseDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            noiseModels: [],
            averageNoise: null,
            currentNoise: null,
          ));
        }

        emit(
          NoiseDataState(
            errorMessage: '',
            status: Status.isPressed,
            noiseModels: dataModels,
            averageNoise: averageValue,
            currentNoise: currentValue,
          ),
        );
      },
    );
  }

  Future<void> noiseData2() async {
    int currentValue = 0;
    int sumValue = 0;
    int averageValue = 0;
    for (final datamodel in state.noiseModels) {
      currentValue = datamodel.noise;
      sumValue += datamodel.noise;
      averageValue = (sumValue ~/ state.noiseModels.length).toInt();
    }
    _streamSubscription = _noiseRepository.getNoiseDataModel2().listen(
      (dataModels) {
        if (dataModels.isEmpty) {
          emit(const NoiseDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            noiseModels: [],
            averageNoise: null,
            currentNoise: null,
          ));
        }

        emit(
          NoiseDataState(
            errorMessage: '',
            status: Status.isPressed,
            noiseModels: dataModels,
            averageNoise: averageValue,
            currentNoise: currentValue,
          ),
        );
      },
    );
  }

  Future<void> noiseData3() async {
    int currentValue = 0;
    int sumValue = 0;
    int averageValue = 0;
    for (final datamodel in state.noiseModels) {
      currentValue = datamodel.noise;
      sumValue += datamodel.noise;
      averageValue = (sumValue ~/ state.noiseModels.length).toInt();
    }
    _streamSubscription = _noiseRepository.getNoiseDataModel3().listen(
      (dataModels) {
        if (dataModels.isEmpty) {
          emit(const NoiseDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            noiseModels: [],
            averageNoise: null,
            currentNoise: null,
          ));
        }

        emit(
          NoiseDataState(
            errorMessage: '',
            status: Status.isPressed,
            noiseModels: dataModels,
            averageNoise: averageValue,
            currentNoise: currentValue,
          ),
        );
      },
    );
  }

  Future<void> noiseData4() async {
    int currentValue = 0;
    int sumValue = 0;
    int averageValue = 0;
    for (final datamodel in state.noiseModels) {
      currentValue = datamodel.noise;
      sumValue += datamodel.noise;
      averageValue = (sumValue ~/ state.noiseModels.length).toInt();
    }
    _streamSubscription = _noiseRepository.getNoiseDataModel4().listen(
      (dataModels) {
        if (dataModels.isEmpty) {
          emit(const NoiseDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            noiseModels: [],
            averageNoise: null,
            currentNoise: null,
          ));
        }

        emit(
          NoiseDataState(
            errorMessage: '',
            status: Status.isPressed,
            noiseModels: dataModels,
            averageNoise: averageValue,
            currentNoise: currentValue,
          ),
        );
      },
    );
  }

  Future<void> noiseData5() async {
    int currentValue = 0;
    int sumValue = 0;
    int averageValue = 0;
    for (final datamodel in state.noiseModels) {
      currentValue = datamodel.noise;
      sumValue += datamodel.noise;
      averageValue = (sumValue ~/ state.noiseModels.length).toInt();
    }
    _streamSubscription = _noiseRepository.getNoiseDataModel5().listen(
      (dataModels) {
        if (dataModels.isEmpty) {
          emit(const NoiseDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            noiseModels: [],
            averageNoise: null,
            currentNoise: null,
          ));
        }

        emit(
          NoiseDataState(
            errorMessage: '',
            status: Status.isPressed,
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
