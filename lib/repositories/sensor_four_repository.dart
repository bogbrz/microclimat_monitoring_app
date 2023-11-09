import 'package:microclimat_monitoring_app/data_source/sensor_four_data_source.dart';
import 'package:microclimat_monitoring_app/models/sensor_model.dart';

class SensorFourRepository {
  SensorFourRepository({required this.sensorFourDataSource});
  final SensorFourDataSource sensorFourDataSource;

  Stream<List<SensorModel>> getSensorFourData() {
    return sensorFourDataSource.sensorFourData().map(
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
