import 'dart:async';

import 'package:microclimat_monitoring_app/data_source/remote_data_source.dart';
import 'package:microclimat_monitoring_app/datamodel.dart';

class Repository {
  Repository(this._remoteData);
  final RemoteData _remoteData;

  Stream<List<DataModel>> getDataModel() {
    return _remoteData.getDataModelStream().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => DataModel(temperature: doc["temp"], date: doc['day']))
          .toList();
    });
  }

  Future<void> add(int temp, int day) async {
    return _remoteData.add(temp: temp, day: day);
  }
}
