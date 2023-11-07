import 'package:microclimat_monitoring_app/data_source/sensor_four_data_source.dart';
import 'package:microclimat_monitoring_app/models/humidity_model.dart';
import 'package:microclimat_monitoring_app/models/noise_model.dart';
import 'package:microclimat_monitoring_app/models/temp_model.dart';

class SensorFourRepository {
  SensorFourRepository(this._sensorFourDataSource);
  final SensorFourDataSource _sensorFourDataSource;

  Stream<List<HumidityModel>> getsensorFourHumidity() {
    return _sensorFourDataSource.sensorFourHumidity().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) =>
              HumidityModel(humidity: doc["humidity"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<TempModel>> getsensorFourTemp() {
    return _sensorFourDataSource.sensorFourTemp().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => TempModel(temp: doc["temp"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<NoiseModel>> getsensorFourNoise() {
    return _sensorFourDataSource.sensorFourNoise().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => NoiseModel(noise: doc["noise"], hour: doc['hour']))
          .toList();
    });
  }
}
