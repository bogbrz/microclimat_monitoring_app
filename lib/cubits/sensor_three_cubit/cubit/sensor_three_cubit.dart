import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:microclimat_monitoring_app/domain/models/sensor_model.dart';

import 'package:microclimat_monitoring_app/domain/repositories/sensor_three_repository.dart';

part 'sensor_three_state.dart';

@injectable
class SensorThreeCubit extends Cubit<SensorThreeState> {
  SensorThreeCubit({required this.sensorThreeRepository})
      : super(SensorThreeState(
          sensorThreeModels: [],
          averageHumidity: null,
          averageNoise: null,
          averageTemp: null,
          errorMessage: '',
          currentHumidity: null,
          currentNoise: null,
          currentTemp: null,
          isCorrect: true,
          isCorrect2: true,
          isCorrect3: true,
        ));

  StreamSubscription? _streamSubscription;
  final SensorThreeRepository sensorThreeRepository;

  Future<void> start() async {
    _streamSubscription =
        sensorThreeRepository.getSensorThreeData().listen((dataModels) {
      try {
        emit(
          SensorThreeState(
            sensorThreeModels: dataModels,
            averageHumidity: null,
            averageNoise: null,
            averageTemp: null,
            errorMessage: '',
            currentHumidity: null,
            currentNoise: null,
            currentTemp: null,
            isCorrect: true,
            isCorrect2: true,
            isCorrect3: true,
          ),
        );
      } catch (error) {
        emit(SensorThreeState(
          errorMessage: error.toString(),
          currentHumidity: null,
          currentNoise: null,
          currentTemp: null,
          sensorThreeModels: [],
          averageHumidity: null,
          averageNoise: null,
          averageTemp: null,
          isCorrect: true,
          isCorrect2: true,
          isCorrect3: true,
        ));
      }
      int? currentTemp;
      int sumTemp = 0;
      int? averageTemp;
      int? currentNoise;
      int sumNoise = 0;
      int? averageNoise;
      int? currentHumidity;
      int sumHumidity = 0;
      int? averageHumidity;
      for (final datamodel in dataModels) {
        sumTemp += datamodel.temp;
        sumNoise += datamodel.noise;
        sumHumidity += datamodel.humidity;
        currentTemp = datamodel.temp;
        currentNoise = datamodel.noise;
        currentHumidity = datamodel.humidity;
        averageTemp =
            (sumTemp ~/ ((state.sensorThreeModels.length) ~/ 3).toDouble());
        averageNoise =
            (sumNoise ~/ ((state.sensorThreeModels.length) ~/ 3).toDouble());

        averageHumidity =
            (sumHumidity ~/ ((state.sensorThreeModels.length) ~/ 3));
      }
      if (currentHumidity != null) {
        if (currentHumidity > 25 || currentHumidity < 10) {
          state.isCorrect2 = false;
        } else {
          state.isCorrect2 = true;
        }
      }
      if (currentTemp != null) {
        if (currentTemp > 25 || currentTemp < 10) {
          state.isCorrect = false;
        } else {
          state.isCorrect = true;
        }
      }
      if (currentNoise != null) {
        if (currentNoise > 25 || currentNoise < 10) {
          state.isCorrect3 = false;
        } else {
          state.isCorrect3 = true;
        }
      }
      emit(
        SensorThreeState(
          errorMessage: '',
          averageTemp: averageTemp,
          averageHumidity: averageHumidity,
          averageNoise: averageNoise,
          currentTemp: currentTemp,
          currentHumidity: currentHumidity,
          currentNoise: currentNoise,
          sensorThreeModels: dataModels,
          isCorrect2: state.isCorrect2,
          isCorrect3: state.isCorrect3,
          isCorrect: state.isCorrect,
        ),
      );
    });
  }

  Future<void> addDataThree() async {
    for (int i = 5; i <= 24; i++) {
      int randomTemp = Random().nextInt(30);
      int randomHumidity = Random().nextInt(30);
      int randomNoise = Random().nextInt(30);
      int sensorId = 3;
      await Future.delayed(
        const Duration(
          seconds: 5,
        ),
      );
      sensorThreeRepository.addData(
          hour: i,
          temp: randomTemp,
          humidity: randomHumidity,
          noise: randomNoise,
          sensorId: sensorId);
    }
  }

  Future<void> removeGeneratedData() async {
    return sensorThreeRepository.removeGeneratedData();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}