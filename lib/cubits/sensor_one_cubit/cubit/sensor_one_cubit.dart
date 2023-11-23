import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:microclimat_monitoring_app/domain/models/sensor_model.dart';
import 'package:microclimat_monitoring_app/domain/repositories/sensor_one_repository.dart';

part 'sensor_one_cubit.freezed.dart';
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
      bool isCorrect = true;
      bool isCorrect2 = true;
      bool isCorrect3 = true;
      for (final datamodel in dataModels) {
        sumTemp += datamodel.temp;
        sumNoise += datamodel.noise;
        sumHumidity += datamodel.humidity;
        currentTemp = datamodel.temp;
        currentNoise = datamodel.noise;
        currentHumidity = datamodel.humidity;
        averageTemp = (sumTemp ~/ ((dataModels.length)));
        averageNoise = (sumNoise ~/ ((dataModels.length)));

        averageHumidity = (sumHumidity ~/ ((dataModels.length)));
      }

      if (currentHumidity != null) {
        if (currentHumidity > 25 || currentHumidity < 10) {
          isCorrect2 = false;
        } else {
          isCorrect2 = true;
        }
      }
      if (currentTemp != null) {
        if (currentTemp > 25 || currentTemp < 10) {
          isCorrect = false;
        } else {
          isCorrect = true;
        }
      }
      if (currentNoise != null) {
        if (currentNoise > 25 || currentNoise < 10) {
          isCorrect3 = false;
        } else {
          isCorrect3 = true;
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
          isCorrect2: isCorrect2,
          isCorrect3: isCorrect3,
          isCorrect: isCorrect,
        ),
      );
    });
  }

  Future<void> addDataOne() async {
    for (int i = 0; i <= 24; i++) {
      int randomTemp = Random().nextInt(30);
      int randomHumidity = Random().nextInt(30);
      int randomNoise = Random().nextInt(30);
      int sensorId = 1;
      await Future.delayed(
        const Duration(
          seconds: 5,
        ),
      );

      sensorOneRepository.addData(
        hour: i,
        temp: randomTemp,
        humidity: randomHumidity,
        noise: randomNoise,
        sensorId: sensorId,
      );
    }
  }

  Future<void> removeGeneratedData() async {
    try {
      return sensorOneRepository.removeGeneratedData();
    } catch (error) {
      emit(SensorOneState(
          isCorrect2: true,
          isCorrect3: true,
          isCorrect: true,
          averageHumidity: null,
          averageNoise: null,
          averageTemp: null,
          errorMessage: error.toString(),
          currentHumidity: null,
          currentNoise: null,
          currentTemp: null,
          sensorOneModels: []));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
