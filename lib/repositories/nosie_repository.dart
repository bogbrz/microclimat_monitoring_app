import 'package:microclimat_monitoring_app/data_source/nosie_data_source.dart';
import 'package:microclimat_monitoring_app/models/noise_model.dart';

class NoiseRepository {
  NoiseRepository(this._noiseDataSource);
  final NoiseDataSource _noiseDataSource;

  Stream<List<NoiseModel>> getNoiseDataModel() {
    return _noiseDataSource.getNoiseData().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => NoiseModel(noise: doc["noise"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<NoiseModel>> getNoiseDataModel2() {
    return _noiseDataSource.getNoiseData2().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => NoiseModel(noise: doc["noise"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<NoiseModel>> getNoiseDataModel3() {
    return _noiseDataSource.getNoiseData3().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => NoiseModel(noise: doc["noise"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<NoiseModel>> getNoiseDataModel4() {
    return _noiseDataSource.getNoiseData4().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => NoiseModel(noise: doc["noise"], hour: doc['hour']))
          .toList();
    });
  }

  Stream<List<NoiseModel>> getNoiseDataModel5() {
    return _noiseDataSource.getNoiseData5().map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => NoiseModel(noise: doc["noise"], hour: doc['hour']))
          .toList();
    });
  }

  Future<void> addNoise({required int noise, required int hour}) async {
    return _noiseDataSource.addNoise(noise: noise, hour: hour);
  }

  Future<void> addNoise2({required int noise, required int hour}) async {
    return _noiseDataSource.addNoise2(noise: noise, hour: hour);
  }

  Future<void> addNoise3({required int noise, required int hour}) async {
    return _noiseDataSource.addNoise3(noise: noise, hour: hour);
  }

  Future<void> addNoise4({required int noise, required int hour}) async {
    return _noiseDataSource.addNoise4(noise: noise, hour: hour);
  }

  Future<void> addNoise5({required int noise, required int hour}) async {
    return _noiseDataSource.addNoise5(noise: noise, hour: hour);
  }
}
