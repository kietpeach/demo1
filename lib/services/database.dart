import 'package:K1/models/kiet.dart';
import 'package:K1/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference kietCollection =
      FirebaseFirestore.instance.collection('kiet');

  Future updateUserData(String sugars, String name, int strength) async {
    return await kietCollection.doc(uid).set({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  //kiet list from snapshot
  List<Kiet> _kietListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Kiet(
          name: doc.data()['name'] ?? '',
          strength: doc.data()['strength'] ?? 0,
          sugars: doc.data()['sugars'] ?? '0%');
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      sugars: snapshot.data()['sugars'],
      strength: snapshot.data()['strength'],
    );
  }

  //get kiet stream
  Stream<List<Kiet>> get kiet {
    return kietCollection.snapshots().map(_kietListFromSnapshot);
  }

  //get user doc stream
  Stream<UserData> get userData {
    return kietCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
