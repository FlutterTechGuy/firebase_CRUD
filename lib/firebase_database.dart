import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDB {
  static final _firebaseFireStore = FirebaseFirestore.instance;
  static Future create() async {
    final ref = _firebaseFireStore.collection("user");
    await ref.doc("123").set({"Heelo": " this is a set id"});
    final rs = await ref.add({"hello": "hello", "user": "Rabin"});
  }

  static Future update() async {
    final ref = _firebaseFireStore.collection("messages");

    await ref.doc('i26wfuH0D01yfeS1TJmC').update({"user1": "US"});
  }

  static Future read() async {
    final ref = _firebaseFireStore.collection("messages");

    final res =
        await ref.where('user', isEqualTo: "Bibek").orderBy('age').get();
    print(res.docs);
    for (var data in res.docs) {
      print(data.data()['address']);
    }
    print(res);
  }

  static Future delete() async {
    final ref = _firebaseFireStore.collection("messages");

    await ref.doc('i26wfuH0D01yfeS1TJmC').delete();
  }
}
