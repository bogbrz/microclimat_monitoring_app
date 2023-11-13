import 'package:injectable/injectable.dart';
import 'package:microclimat_monitoring_app/data_source/sensor_five_data_source.dart';
import 'package:microclimat_monitoring_app/domain/models/sensor_model.dart';

@injectable
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

  Future<void> addData(
      {required int hour,
      required int temp,
      required int humidity,
      required int noise,
      required int sensorId}) async {
    await sensorFiveDataSource.addData(
        hour: hour,
        temp: temp,
        humidity: humidity,
        noise: noise,
        sensorId: sensorId);
  }

  Future<void> removeGeneratedData() async {
    return sensorFiveDataSource.removeGeneratedData();
  }
}
