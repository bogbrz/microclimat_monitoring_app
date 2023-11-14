import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:microclimat_monitoring_app/domain/models/sensor_model.dart';

import 'package:microclimat_monitoring_app/domain/repositories/sensor_five_repository.dart';

part 'sensor_five_state.dart';
part 'sensor_five_cubit.freezed.dart';

@injectable
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
      if (currentHumidity != 0) {
        if (currentHumidity > 25 || currentHumidity < 10) {
          isCorrect2 = false;
        } else {
          isCorrect2 = true;
        }
      }
      if (currentTemp != 0) {
        if (currentTemp > 25 || currentTemp < 10) {
          isCorrect = false;
        } else {
          isCorrect = true;
        }
      }
      if (currentNoise != 0) {
        if (currentNoise > 25 || currentNoise < 10) {
          isCorrect3 = false;
        } else {
          isCorrect3 = true;
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
          isCorrect2: isCorrect2,
          isCorrect3: isCorrect3,
          isCorrect: isCorrect,
        ),
      );
    });
  }

  Future<void> addDataFive() async {
    for (int i = 1; i <= 24; i++) {
      int randomTemp = Random().nextInt(30);
      int randomHumidity = Random().nextInt(30);
      int randomNoise = Random().nextInt(30);
      int sensorId = 5;
      await Future.delayed(
        const Duration(
          seconds: 5,
        ),
      );

      sensorFiveRepository.addData(
        hour: i,
        temp: randomTemp,
        humidity: randomHumidity,
        noise: randomNoise,
        sensorId: sensorId,
      );
    }
  }

  Future<void> removeGeneratedData() async {
    return sensorFiveRepository.removeGeneratedData();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
