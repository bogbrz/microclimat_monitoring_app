import 'dart:async';

import 'package:microclimat_monitoring_app/data_source/temperature_data_source.dart';
import 'package:microclimat_monitoring_app/models/temp_model.dart';

class TempRepository {
  TempRepository(this._tempDataSource);
  final TempDataSource _tempDataSource;

  Stream<List<TempModel>> getTempDataModel() {
    return _tempDataSource.getTempData().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => TempModel(temp: doc["temp"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<TempModel>> getTempDataModel2() {
    return _tempDataSource.getTempData2().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => TempModel(temp: doc["temp"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<TempModel>> getTempDataModel3() {
    return _tempDataSource.getTempData3().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => TempModel(temp: doc["temp"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<TempModel>> getTempDataModel4() {
    return _tempDataSource.getTempData4().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => TempModel(temp: doc["temp"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<TempModel>> getTempDataModel5() {
    return _tempDataSource.getTempData5().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => TempModel(temp: doc["temp"], hour: doc['hour']))
          .toList();
    });
  }

  Future<void> addTemp({required int temp, required int hour}) async {
    return _tempDataSource.addTemp(temp: temp, hour: hour);
  }

  Future<void> addTemp2({required int temp, required int hour}) async {
    return _tempDataSource.addTemp2(temp: temp, hour: hour);
  }

  Future<void> addTemp3({required int temp, required int hour}) async {
    return _tempDataSource.addTemp3(temp: temp, hour: hour);
  }

  Future<void> addTemp4({required int temp, required int hour}) async {
    return _tempDataSource.addTemp4(temp: temp, hour: hour);
  }

  Future<void> addTemp5({required int temp, required int hour}) async {
    return _tempDataSource.addTemp5(temp: temp, hour: hour);
  }
}
