import 'package:microclimat_monitoring_app/data_source/sensor_one_data_source.dart';
import 'package:microclimat_monitoring_app/models/sensor_model.dart';

class SensorOneRepository {
  SensorOneRepository({required this.sensorOneDataSource});
  final SensorOneDataSource sensorOneDataSource;

  Stream<List<SensorModel>> getSensorOneData() {
    return sensorOneDataSource.sensorOneData().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        final data = doc.data();

        return SensorModel.fromJson(
          data,
        );
      }).toList();
    });
  }
}
