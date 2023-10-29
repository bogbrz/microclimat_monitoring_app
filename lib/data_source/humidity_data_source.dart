import 'package:cloud_firestore/cloud_firestore.dart';

class HumidityDataSource {
  Stream<QuerySnapshot> getHumidityData() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor1')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('humidity')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getHumidityData2() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor2')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('humidity')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getHumidityData3() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor3')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('humidity')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getHumidityData4() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor4')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('humidity')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getHumidityData5() {
    return FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor5')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('humidity')
        .orderBy('hour', descending: false)
        .snapshots();
  }

  Future<void> addHumidity({required int humidity, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor1')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('humidity')
        .add({
      'hour': hour,
      'humidity': humidity,
    });
  }

  Future<void> addHumidity2({required int humidity, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor2')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('humidity')
        .add({
      'hour': hour,
      'humidity': humidity,
    });
  }

  Future<void> addHumidity3({required int humidity, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor3')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('humidity')
        .add({
      'hour': hour,
      'humidity': humidity,
    });
  }

  Future<void> addHumidity4({required int humidity, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor4')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('humidity')
        .add({
      'hour': hour,
      'humidity': humidity,
    });
  }

  Future<void> addHumidity5({required int humidity, required int hour}) async {
    await FirebaseFirestore.instance
        .collection('sensors')
        .doc('sensor5')
        .collection('month')
        .doc('november')
        .collection('days')
        .doc('1')
        .collection('humidity')
        .add({
      'hour': hour,
      'humidity': humidity,
    });
  }
}
