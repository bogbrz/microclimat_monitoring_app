import 'package:microclimat_monitoring_app/data_source/sensor_two_data_source.dart';
import 'package:microclimat_monitoring_app/models/sensor_model.dart';

class SensorTwoRepository {
  SensorTwoRepository({required this.sensorTwoDataSource});
  final SensorTwoDataSource sensorTwoDataSource;

  Stream<List<SensorModel>> getSensorTwoData() {
    return sensorTwoDataSource.sensorTwoData().map((querySnapshot) {
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
