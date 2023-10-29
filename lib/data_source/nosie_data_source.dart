import 'package:cloud_firestore/cloud_firestore.dart';

class NoiseDataSource {
  Stream<QuerySnapshot> getNoiseData() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor1')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('noise')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getNoiseData2() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor2')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('noise')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getNoiseData3() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor3')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('noise')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getNoiseData4() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor4')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('noise')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getNoiseData5() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor5')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('noise')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Future<void> addNoise({required int noise, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor1')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('noise')
        .add({
      'hour': hour,
      'noise': noise,
    });
  }

  Future<void> addNoise2({required int noise, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor2')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('noise')
        .add({
      'hour': hour,
      'noise': noise,
    });
  }

  Future<void> addNoise3({required int noise, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor3')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('noise')
        .add({
      'hour': hour,
      'noise': noise,
    });
  }

  Future<void> addNoise4({required int noise, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor4')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('noise')
        .add({
      'hour': hour,
      'noise': noise,
    });
  }

  Future<void> addNoise5({required int noise, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor5')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('noise')
        .add({
      'hour': hour,
      'noise': noise,
    });
  }
}
