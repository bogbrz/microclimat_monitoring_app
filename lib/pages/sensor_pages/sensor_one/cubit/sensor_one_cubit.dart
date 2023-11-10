import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:microclimat_monitoring_app/models/sensor_model.dart';
import 'package:microclimat_monitoring_app/repositories/sensor_one_repository.dart';

part 'sensor_one_state.dart';

class SensorOneCubit extends Cubit<SensorOneState> {
  SensorOneCubit({required this.sensorOneRepository})
      : super(SensorOneState(
          sensorOneModels: [],
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
        ));

  StreamSubscription? _streamSubscription;
  final SensorOneRepository sensorOneRepository;

  Future<void> start() async {
    _streamSubscription =
        sensorOneRepository.getSensorOneData().listen((dataModels) {
      try {
        emit(
          SensorOneState(
            sensorOneModels: dataModels,
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
        emit(SensorOneState(
          errorMessage: error.toString(),
          currentHumidity: null,
          currentNoise: null,
          currentTemp: null,
          sensorOneModels: [],
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
            (sumTemp ~/ ((state.sensorOneModels.length) ~/ 3).toDouble());
        averageNoise =
            (sumNoise ~/ ((state.sensorOneModels.length) ~/ 3).toDouble());

        averageHumidity =
            (sumHumidity ~/ ((state.sensorOneModels.length) ~/ 3));
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
        SensorOneState(
          errorMessage: '',
          averageTemp: averageTemp,
          averageHumidity: averageHumidity,
          averageNoise: averageNoise,
          currentTemp: currentTemp,
          currentHumidity: currentHumidity,
          currentNoise: currentNoise,
          sensorOneModels: dataModels,
          isCorrect2: state.isCorrect2,
          isCorrect3: state.isCorrect3,
          isCorrect: state.isCorrect,
        ),
      );
    });
  }

  Future<void> addDataOne({
    required int temp,
    required int hour,
    required int humidity,
    required int noise,
    required int sensorId,
  }) async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    sensorOneRepository.addData(
        hour: hour,
        temp: temp,
        humidity: humidity,
        noise: noise,
        sensorId: sensorId);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
