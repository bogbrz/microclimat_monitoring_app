import 'package:microclimat_monitoring_app/data_source/sensor_two_data_source.dart';
import 'package:microclimat_monitoring_app/models/humidity_model.dart';
import 'package:microclimat_monitoring_app/models/noise_model.dart';
import 'package:microclimat_monitoring_app/models/temp_model.dart';

class SensorTwoRepository {
  SensorTwoRepository(this._sensorTwoDataSource);
  final SensorTwoDataSource _sensorTwoDataSource;

  Stream<List<HumidityModel>> getsensorTwoHumidity() {
    return _sensorTwoDataSource.sensorTwoHumidity().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) =>
              HumidityModel(humidity: doc["humidity"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<TempModel>> getsensorTwoTemp() {
    return _sensorTwoDataSource.sensorTwoTemp().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => TempModel(temp: doc["temp"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<NoiseModel>> getsensorTwoNoise() {
    return _sensorTwoDataSource.sensorTwoNoise().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => NoiseModel(noise: doc["noise"], hour: doc['hour']))
          .toList();
    });
  }
}
