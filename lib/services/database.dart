import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{


final String uid;
DatabaseService({this.uid});
  //collection reference
  final CollectionReference kietCollection = FirebaseFirestore.instance.collection('kiet');

  Future updateUserData(String sugars, String name, int strength) async{
    return await kietCollection.doc(uid).set({
      'sugar': sugars,
      'name': name,
      'strength': strength,
    });
  }
}