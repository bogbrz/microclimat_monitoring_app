import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
            buttonColor1: state.buttonColor1,
            buttonColor2: state.buttonColor2,
            buttonColor3: state.buttonColor3,
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
      if (currentHumidity != null &&
          currentNoise != null &&
          currentTemp != null) {
        if (currentHumidity > 25 || currentHumidity < 10) {
          state.buttonColor2 = Colors.red;
        }
        if (currentTemp > 25 || currentTemp < 10) {
          state.buttonColor1 = Colors.red;
        }
        if (currentNoise > 25 || currentNoise < 10) {
          state.buttonColor3 = Colors.red;
        }
      }
      emit(SensorOneState(
          errorMessage: '',
          averageTemp: averageTemp,
          averageHumidity: averageHumidity,
          averageNoise: averageNoise,
          currentTemp: currentTemp,
          currentHumidity: currentHumidity,
          currentNoise: currentNoise,
          sensorOneModels: dataModels,
          buttonColor1: state.buttonColor1,
          buttonColor2: state.buttonColor2,
          buttonColor3: state.buttonColor3));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
