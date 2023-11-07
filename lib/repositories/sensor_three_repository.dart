import 'package:microclimat_monitoring_app/data_source/sensor_three_data_source.dart';
import 'package:microclimat_monitoring_app/models/humidity_model.dart';
import 'package:microclimat_monitoring_app/models/noise_model.dart';
import 'package:microclimat_monitoring_app/models/temp_model.dart';

class SensorThreeRepository {
  SensorThreeRepository(this._sensorThreeDataSource);
  final SensorThreeDataSource _sensorThreeDataSource;

  Stream<List<HumidityModel>> getsensorThreeHumidity() {
    return _sensorThreeDataSource.sensorThreeHumidity().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) =>
              HumidityModel(humidity: doc["humidity"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<TempModel>> getsensorThreeTemp() {
    return _sensorThreeDataSource.sensorThreeTemp().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => TempModel(temp: doc["temp"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<NoiseModel>> getsensorThreeNoise() {
    return _sensorThreeDataSource.sensorThreeNoise().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => NoiseModel(noise: doc["noise"], hour: doc['hour']))
          .toList();
    });
  }
}
