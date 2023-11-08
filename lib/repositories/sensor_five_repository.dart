import 'package:microclimat_monitoring_app/data_source/sensor_five_data_source.dart';
import 'package:microclimat_monitoring_app/models/sensor_model.dart';

class SensorFiveRepository {
  SensorFiveRepository({required this.sensorFiveDataSource});
  final SensorFiveDataSource sensorFiveDataSource;

  Stream<List<SensorModel>> getSensorFiveData() {
    return sensorFiveDataSource.sensorFiveData().map((querySnapshot) {
      return querySnapshot.docs
          .map(
            (doc) => SensorModel(
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
