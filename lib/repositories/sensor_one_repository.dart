import 'package:microclimat_monitoring_app/data_source/sensor_one_data_source.dart';
import 'package:microclimat_monitoring_app/models/sensor_one_model.dart';

class SensorOneRepository {
  SensorOneRepository(this._sensorOneDataSource);
  final SensorOneDataSource _sensorOneDataSource;

  Stream<List<SensorOneModel>> getSensorOneData() {
    return _sensorOneDataSource.sensorOneData().map((querySnapshot) {
      return querySnapshot.docs
          .map(
            (doc) => SensorOneModel(
              humidity: doc["humidity"],
              hour: doc['hour'],
              temp: doc['temp'],
              noise: doc['noise'],
            ),
          )
          .toList();
    });
  }
}
