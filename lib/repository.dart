import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:microclimat_monitoring_app/datamodel.dart';

class Repository {
  Stream<List<DataModel>> getDataModelStream() {
    return FirebaseFirestore.instance
        .collection('sensor1')
        .orderBy('date')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return DataModel(temperature: doc['temperature'], date: doc['date']);
      }).toList();
    });
  }
}
