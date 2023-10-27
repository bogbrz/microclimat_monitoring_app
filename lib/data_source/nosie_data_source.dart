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
}
