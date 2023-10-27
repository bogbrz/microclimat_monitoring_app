import 'package:microclimat_monitoring_app/data_source/nosie_data_source.dart';
import 'package:microclimat_monitoring_app/datamodel.dart';

class NoiseRepository {
  NoiseRepository(this._noiseDataSource);
  final NoiseDataSource _noiseDataSource;

  Stream<List<DataModel>> getNoiseDataModel() {
    return _noiseDataSource.getNoiseData().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => DataModel(value: doc["noise"], hour: doc['hour']))
          .toList();
    });
  }

  Future<void> addNoise({required int noise, required int hour}) async {
    return _noiseDataSource.addNoise(noise: noise, hour: hour);
  }
}
