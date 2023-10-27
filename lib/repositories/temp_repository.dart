import 'dart:async';

import 'package:microclimat_monitoring_app/data_source/temperature_data_source.dart';
import 'package:microclimat_monitoring_app/datamodel.dart';

class TempRepository {
  TempRepository(this._tempDataSource);
  final TempDataSource _tempDataSource;

  Stream<List<DataModel>> getTempDataModel() {
    return _tempDataSource.getTempData().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => DataModel(value: doc["temp"], hour: doc['hour']))
          .toList();
    });
  }

  Future<void> addTemp({required int temp, required int hour}) async {
    return _tempDataSource.addTemp(temp: temp, hour: hour);
  }
}
