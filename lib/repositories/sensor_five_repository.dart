import 'package:microclimat_monitoring_app/data_source/sensor_five_data_source.dart';
import 'package:microclimat_monitoring_app/models/humidity_model.dart';
import 'package:microclimat_monitoring_app/models/noise_model.dart';
import 'package:microclimat_monitoring_app/models/temp_model.dart';

class SensorFiveRepository {
  SensorFiveRepository(this._sensorFiveDataSource);
  final SensorFiveDataSource _sensorFiveDataSource;

  Stream<List<HumidityModel>> getsensorFiveHumidity() {
    return _sensorFiveDataSource.sensorFiveHumidity().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) =>
              HumidityModel(humidity: doc["humidity"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<TempModel>> getsensorFiveTemp() {
    return _sensorFiveDataSource.sensorFiveTemp().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => TempModel(temp: doc["temp"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<NoiseModel>> getsensorFiveNoise() {
    return _sensorFiveDataSource.sensorFiveNoise().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => NoiseModel(noise: doc["noise"], hour: doc['hour']))
          .toList();
    });
  }
}
