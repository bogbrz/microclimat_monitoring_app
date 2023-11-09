import 'package:microclimat_monitoring_app/data_source/sensor_five_data_source.dart';
import 'package:microclimat_monitoring_app/models/sensor_model.dart';

class SensorFiveRepository {
  SensorFiveRepository({required this.sensorFiveDataSource});
  final SensorFiveDataSource sensorFiveDataSource;

  Stream<List<SensorModel>> getSensorFiveData() {
    return sensorFiveDataSource.sensorFiveData().map(
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
