import 'package:injectable/injectable.dart';
import 'package:microclimat_monitoring_app/data_source/sensor_four_data_source.dart';
import 'package:microclimat_monitoring_app/domain/models/sensor_model.dart';


@injectable
class SensorFourRepository {
  SensorFourRepository({required this.sensorFourDataSource});
  final SensorFourDataSource sensorFourDataSource;

  Stream<List<SensorModel>> getSensorFourData() {
    return sensorFourDataSource.sensorFourData().map((querySnapshot) {
      return querySnapshot.docs
          .map(
            (doc) => SensorModel(
              humidity: doc["humidity"],
              hour: doc['hour'],
              temp: doc['temp'],
              noise: doc['noise'],
              sensorId: doc['sensorId'],
            ),
          )
          .toList();
    });
  }

  Future<void> addData(
      {required int hour,
      required int temp,
      required int humidity,
      required int noise,
      required int sensorId}) async {
    await sensorFourDataSource.addData(
        hour: hour,
        temp: temp,
        humidity: humidity,
        noise: noise,
        sensorId: sensorId);
  }

  Future<void> removeGeneratedData() async {
    await sensorFourDataSource.removeGeneratedData();
  }
}
