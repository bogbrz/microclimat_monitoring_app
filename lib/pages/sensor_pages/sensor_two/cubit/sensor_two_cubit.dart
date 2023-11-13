import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:microclimat_monitoring_app/models/sensor_model.dart';
import 'package:microclimat_monitoring_app/repositories/sensor_two_repository.dart';

part 'sensor_two_state.dart';

@injectable
class SensorTwoCubit extends Cubit<SensorTwoState> {
  SensorTwoCubit({required this.sensorTwoRepository})
      : super(SensorTwoState(
          errorMessage: '',
          averageHumidity: null,
          averageNoise: null,
          averageTemp: null,
          sensorTwoModels: [],
          currentHumidity: null,
          currentNoise: null,
          currentTemp: null,
          isCorrect2: true,
          isCorrect3: true,
          isCorrect: true,
        ));

  StreamSubscription? _streamSubscription;
  final SensorTwoRepository sensorTwoRepository;

  Future<void> start() async {
    _streamSubscription =
        sensorTwoRepository.getSensorTwoData().listen((dataModels) {
      try {
        emit(
          SensorTwoState(
            sensorTwoModels: dataModels,
            averageHumidity: null,
            averageNoise: null,
            averageTemp: null,
            errorMessage: '',
            currentHumidity: null,
            currentNoise: null,
            currentTemp: null,
            isCorrect2: true,
            isCorrect3: true,
            isCorrect: true,
          ),
        );
      } catch (error) {
        emit(SensorTwoState(
          errorMessage: error.toString(),
          currentHumidity: null,
          currentNoise: null,
          currentTemp: null,
          sensorTwoModels: [],
          averageHumidity: null,
          averageNoise: null,
          averageTemp: null,
          isCorrect2: true,
          isCorrect3: true,
          isCorrect: true,
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
            (sumTemp ~/ ((state.sensorTwoModels.length) ~/ 3).toDouble());
        averageNoise =
            (sumNoise ~/ ((state.sensorTwoModels.length) ~/ 3).toDouble());

        averageHumidity =
            (sumHumidity ~/ ((state.sensorTwoModels.length) ~/ 3));
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
        SensorTwoState(
          errorMessage: '',
          averageTemp: averageTemp,
          averageHumidity: averageHumidity,
          averageNoise: averageNoise,
          currentTemp: currentTemp,
          currentHumidity: currentHumidity,
          currentNoise: currentNoise,
          sensorTwoModels: dataModels,
          isCorrect2: state.isCorrect2,
          isCorrect3: state.isCorrect3,
          isCorrect: state.isCorrect,
        ),
      );
    });
  }

  Future<void> addDataTwo() async {
    for (int i = 5; i <= 24; i++) {
      int randomTemp = Random().nextInt(30);
      int randomHumidity = Random().nextInt(30);
      int randomNoise = Random().nextInt(30);
      int sensorId = 2;
      await Future.delayed(
        const Duration(
          seconds: 5,
        ),
      );
      sensorTwoRepository.addData(
          hour: i,
          temp: randomTemp,
          humidity: randomHumidity,
          noise: randomNoise,
          sensorId: sensorId);
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
