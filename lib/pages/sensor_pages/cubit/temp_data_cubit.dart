import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
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
    int currentValue = 0;
    int sumValue = 0;
    int averageValue = 0;
    for (final datamodel in state.tempModels) {
      currentValue = datamodel.temp;
      sumValue += datamodel.temp;
      averageValue = (sumValue ~/ state.tempModels.length).toInt();
    }
    _streamSubscription = _tempRepository.getTempDataModel().listen(
      (dataModels) {
        if (dataModels.isEmpty) {
          emit(const TempDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            tempModels: [],
            averagetemp: null,
            currentTemp: null,
          ));
        }

        emit(
          TempDataState(
            errorMessage: '',
            status: Status.isPressed,
            tempModels: dataModels,
            averagetemp: averageValue,
            currentTemp: currentValue,
          ),
        );
      },
    );
  }

  Future<void> tempData2() async {
    int currentValue = 0;
    int sumValue = 0;
    int averageValue = 0;
    for (final datamodel in state.tempModels) {
      currentValue = datamodel.temp;
      sumValue += datamodel.temp;
      averageValue = (sumValue ~/ state.tempModels.length).toInt();
    }
    _streamSubscription = _tempRepository.getTempDataModel2().listen(
      (dataModels) {
        if (dataModels.isEmpty) {
          emit(const TempDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            tempModels: [],
            averagetemp: null,
            currentTemp: null,
          ));
        }

        emit(
          TempDataState(
            errorMessage: '',
            status: Status.isPressed,
            tempModels: dataModels,
            averagetemp: averageValue,
            currentTemp: currentValue,
          ),
        );
      },
    );
  }

  Future<void> tempData3() async {
    int currentValue = 0;
    int sumValue = 0;
    int averageValue = 0;
    for (final datamodel in state.tempModels) {
      currentValue = datamodel.temp;
      sumValue += datamodel.temp;
      averageValue = (sumValue ~/ state.tempModels.length).toInt();
    }
    _streamSubscription = _tempRepository.getTempDataModel3().listen(
      (dataModels) {
        if (dataModels.isEmpty) {
          emit(const TempDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            tempModels: [],
            averagetemp: null,
            currentTemp: null,
          ));
        }

        emit(
          TempDataState(
            errorMessage: '',
            status: Status.isPressed,
            tempModels: dataModels,
            averagetemp: averageValue,
            currentTemp: currentValue,
          ),
        );
      },
    );
  }

  Future<void> tempData4() async {
    int currentValue = 0;
    int sumValue = 0;
    int averageValue = 0;
    for (final datamodel in state.tempModels) {
      currentValue = datamodel.temp;
      sumValue += datamodel.temp;
      averageValue = (sumValue ~/ state.tempModels.length).toInt();
    }
    _streamSubscription = _tempRepository.getTempDataModel4().listen(
      (dataModels) {
        if (dataModels.isEmpty) {
          emit(const TempDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            tempModels: [],
            averagetemp: null,
            currentTemp: null,
          ));
        }

        emit(
          TempDataState(
            errorMessage: '',
            status: Status.isPressed,
            tempModels: dataModels,
            averagetemp: averageValue,
            currentTemp: currentValue,
          ),
        );
      },
    );
  }

  Future<void> tempData5() async {
    int currentValue = 0;
    int sumValue = 0;
    int averageValue = 0;
    for (final datamodel in state.tempModels) {
      currentValue = datamodel.temp;
      sumValue += datamodel.temp;
      averageValue = (sumValue ~/ state.tempModels.length).toInt();
    }
    _streamSubscription = _tempRepository.getTempDataModel5().listen(
      (dataModels) {
        if (dataModels.isEmpty) {
          emit(const TempDataState(
            errorMessage: 'Missing data',
            status: Status.error,
            tempModels: [],
            averagetemp: null,
            currentTemp: null,
          ));
        }

        emit(
          TempDataState(
            errorMessage: '',
            status: Status.isPressed,
            tempModels: dataModels,
            averagetemp: averageValue,
            currentTemp: currentValue,
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
