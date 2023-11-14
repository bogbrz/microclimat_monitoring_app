import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';
import 'package:microclimat_monitoring_app/domain/models/sensor_model.dart';

import 'package:microclimat_monitoring_app/domain/repositories/sensor_two_repository.dart';

part 'sensor_two_state.dart';
part 'sensor_two_cubit.freezed.dart';

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
        averageTemp = (sumTemp ~/ ((dataModels.length)).toDouble());
        averageNoise = (sumNoise ~/ ((dataModels.length)).toDouble());

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
        SensorTwoState(
          errorMessage: '',
          averageTemp: averageTemp,
          averageHumidity: averageHumidity,
          averageNoise: averageNoise,
          currentTemp: currentTemp,
          currentHumidity: currentHumidity,
          currentNoise: currentNoise,
          sensorTwoModels: dataModels,
          isCorrect2: isCorrect2,
          isCorrect3: isCorrect3,
          isCorrect: isCorrect,
        ),
      );
    });
  }

  Future<void> addDataTwo() async {
    for (int i = 1; i <= 24; i++) {
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

  Future<void> removeGeneratedData() async {
    return sensorTwoRepository.removeGeneratedData();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
