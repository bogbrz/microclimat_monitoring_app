import 'package:microclimat_monitoring_app/data_source/humidity_data_source.dart';
import 'package:microclimat_monitoring_app/models/humidity_model.dart';

class HumidityRepository {
  HumidityRepository(this._humidityDataSource);
  final HumidityDataSource _humidityDataSource;

  Stream<List<HumidityModel>> getHumidityDataModel() {
    return _humidityDataSource.getHumidityData().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) =>
              HumidityModel(humidity: doc["humidity"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<HumidityModel>> getHumidityDataModel2() {
    return _humidityDataSource.getHumidityData2().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) =>
              HumidityModel(humidity: doc["humidity"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<HumidityModel>> getHumidityDataModel3() {
    return _humidityDataSource.getHumidityData3().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) =>
              HumidityModel(humidity: doc["humidity"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<HumidityModel>> getHumidityDataModel4() {
    return _humidityDataSource.getHumidityData4().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) =>
              HumidityModel(humidity: doc["humidity"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<HumidityModel>> getHumidityDataModel5() {
    return _humidityDataSource.getHumidityData5().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) =>
              HumidityModel(humidity: doc["humidity"], hour: doc['hour']))
          .toList();
    });
  }

  Future<void> addHumidity({required int humidity, required int hour}) async {
    return _humidityDataSource.addHumidity(humidity: humidity, hour: hour);
  }

  Future<void> addHumidity2({required int humidity, required int hour}) async {
    return _humidityDataSource.addHumidity2(humidity: humidity, hour: hour);
  }

  Future<void> addHumidity3({required int humidity, required int hour}) async {
    return _humidityDataSource.addHumidity3(humidity: humidity, hour: hour);
  }

  Future<void> addHumidity4({required int humidity, required int hour}) async {
    return _humidityDataSource.addHumidity4(humidity: humidity, hour: hour);
  }

  Future<void> addHumidity5({required int humidity, required int hour}) async {
    return _humidityDataSource.addHumidity5(humidity: humidity, hour: hour);
  }
}
