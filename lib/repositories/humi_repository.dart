import 'package:microclimat_monitoring_app/data_source/humidity_data_source.dart';
import 'package:microclimat_monitoring_app/datamodel.dart';

class HumidityRepository {
  HumidityRepository(this._humidityDataSource);
  final HumidityDataSource _humidityDataSource;

  Stream<List<DataModel>> getHumidityDataModel() {
    return _humidityDataSource.getHumidityData().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => DataModel(value: doc["humidity"], hour: doc['hour']))
          .toList();
    });
  }

  Future<void> addHumidity({required int humidity, required int hour}) async {
    return _humidityDataSource.addHumidity(humidity: humidity, hour: hour);
  }
}
