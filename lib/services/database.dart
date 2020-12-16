import 'package:login/models/user.dart';
import 'package:login/models/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');
  final CollectionReference locationCollection = Firestore.instance.collection('location');        // --------------------------


  Future<void> updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // location list from snapshot
  List<Location> _locationListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return Location(
        area: doc.data['area'] ?? '',
        geohash: doc.data['geohash'] ?? '',
        region: doc.data['region'] ?? '',
        rock: doc.data['rock'] ?? ''
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Location>> get locations {
    return locationCollection.snapshots()
      .map(_locationListFromSnapshot);
  }

}