import 'package:injectable/injectable.dart';
import 'package:microclimat_monitoring_app/data_source/sensor_one_data_source.dart';
import 'package:microclimat_monitoring_app/domain/models/sensor_model.dart';

@injectable
class SensorOneRepository {
  SensorOneRepository({required this.sensorOneDataSource});
  final SensorOneDataSource sensorOneDataSource;

  Stream<List<SensorModel>> getSensorOneData() {
    return sensorOneDataSource.sensorOneData().map((querySnapshot) {
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
    await sensorOneDataSource.addData(
        hour: hour,
        temp: temp,
        humidity: humidity,
        noise: noise,
        sensorId: sensorId);
  }

  Future<void> removeGeneratedData() async {
    return sensorOneDataSource.removeGeneratedData();
  }
}
