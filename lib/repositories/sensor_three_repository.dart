import 'package:microclimat_monitoring_app/data_source/sensor_three_data_source.dart';
import 'package:microclimat_monitoring_app/models/sensor_model.dart';

class SensorThreeRepository {
  SensorThreeRepository({required this.sensorThreeDataSource});
  final SensorThreeDataSource sensorThreeDataSource;

  Stream<List<SensorModel>> getSensorThreeData() {
    return sensorThreeDataSource.sensorThreeData().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            final data = doc.data();

            return SensorModel.fromJson(data);
          },
        ).toList();
      },
    );
  }
}
