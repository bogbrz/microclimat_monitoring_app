import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:microclimat_monitoring_app/models/sensor_model.dart';
import 'package:microclimat_monitoring_app/repositories/sensor_five_repository.dart';

part 'sensor_five_state.dart';

class SensorFiveCubit extends Cubit<SensorFiveState> {
  SensorFiveCubit({required this.sensorFiveRepository})
      : super(SensorFiveState(
          sensorFiveModels: [],
          averageHumidity: 0,
          averageNoise: 0,
          averageTemp: 0,
          errorMessage: '',
          currentHumidity: 0,
          currentNoise: 0,
          currentTemp: 0,
          isCorrect2: true,
          isCorrect3: true,
          isCorrect: true,
        ));

  StreamSubscription? _streamSubscription;
  final SensorFiveRepository sensorFiveRepository;

  Future<void> start() async {
    _streamSubscription =
        sensorFiveRepository.getSensorFiveData().listen((dataModels) {
      try {
        emit(
          SensorFiveState(
            sensorFiveModels: dataModels,
            averageHumidity: 0,
            averageNoise: 0,
            averageTemp: 0,
            errorMessage: '',
            currentHumidity: 0,
            currentNoise: 0,
            currentTemp: 0,
            isCorrect2: true,
            isCorrect3: true,
            isCorrect: true,
          ),
        );
      } catch (error) {
        emit(SensorFiveState(
          errorMessage: error.toString(),
          currentHumidity: 0,
          currentNoise: 0,
          currentTemp: 0,
          sensorFiveModels: [],
          averageHumidity: 0,
          averageNoise: 0,
          averageTemp: 0,
          isCorrect2: true,
          isCorrect3: true,
          isCorrect: true,
        ));
      }
      int currentTemp = 0;
      int sumTemp = 0;
      int averageTemp = 0;
      int currentNoise = 0;
      int sumNoise = 0;
      int averageNoise = 0;
      int currentHumidity = 0;
      int sumHumidity = 0;
      int averageHumidity = 0;
      for (final datamodel in dataModels) {
        sumTemp += datamodel.temp;
        sumNoise += datamodel.noise;
        sumHumidity += datamodel.humidity;
        currentTemp = datamodel.temp;
        currentNoise = datamodel.noise;
        currentHumidity = datamodel.humidity;
        averageTemp =
            (sumTemp ~/ ((state.sensorFiveModels.length) ~/ 3).toDouble());
        averageNoise =
            (sumNoise ~/ ((state.sensorFiveModels.length) ~/ 3).toDouble());

        averageHumidity =
            (sumHumidity ~/ ((state.sensorFiveModels.length) ~/ 3));
      }
      if (currentHumidity != 0) {
        if (currentHumidity > 25 || currentHumidity < 10) {
          state.isCorrect2 = false;
        } else {
          state.isCorrect2 = true;
        }
      }
      if (currentTemp != 0) {
        if (currentTemp > 25 || currentTemp < 10) {
          state.isCorrect = false;
        } else {
          state.isCorrect = true;
        }
      }
      if (currentNoise != 0) {
        if (currentNoise > 25 || currentNoise < 10) {
          state.isCorrect3 = false;
        } else {
          state.isCorrect3 = true;
        }
      }
      emit(
        SensorFiveState(
          errorMessage: '',
          averageTemp: averageTemp,
          averageHumidity: averageHumidity,
          averageNoise: averageNoise,
          currentTemp: currentTemp,
          currentHumidity: currentHumidity,
          currentNoise: currentNoise,
          sensorFiveModels: dataModels,
          isCorrect2: state.isCorrect2,
          isCorrect3: state.isCorrect3,
          isCorrect: state.isCorrect,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
