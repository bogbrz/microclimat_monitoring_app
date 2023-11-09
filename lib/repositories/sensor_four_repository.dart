import 'package:microclimat_monitoring_app/data_source/sensor_four_data_source.dart';
import 'package:microclimat_monitoring_app/models/sensor_model.dart';

class SensorFourRepository {
  SensorFourRepository({required this.sensorFourDataSource});
  final SensorFourDataSource sensorFourDataSource;

  Stream<List<SensorModel>> getSensorFourData() {
    return sensorFourDataSource.sensorFourData().map(
      (querySnapshot) {

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