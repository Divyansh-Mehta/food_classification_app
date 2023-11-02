import "package:flutter/material.dart";
import "package:food_classification_app/models/treck.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";

class TrecksProvider extends ChangeNotifier {
  List<Treck> treck = [];
  final db = FirebaseFirestore.instance;

  Future<void> fetchAndSetTreck(User user) async {
    if (treck.isEmpty) {
      db.collection("users").doc(user.email).collection("treck").get().then(
        (querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            treck.add(Treck(docSnapshot.data()['name'],
                DateTime.parse(docSnapshot.data()['timestamp'])));
            // print('${docSnapshot.id} => ${docSnapshot.data()}');
          }
        },
        onError: (e) => print("Error completing: $e"),
      );
      notifyListeners();
    }
  }

  Future<void> addTrecks(String name, User user) async {
    final timestamp = DateTime.now();
    db
        .collection("users")
        .doc(user.email)
        .collection("treck")
        .add({"name": name, "timestamp": timestamp.toString()});
    treck.add(Treck(name, timestamp));
    notifyListeners();
  }

  void cleanTreck() {
    treck = [];
  }

  List<Treck> giveTrecksOnDate(DateTime t) {
    List<Treck> temp = [];
    for (Treck tk in treck) {
      if (DateUtils.isSameDay(t, tk.timeStamp)) {
        temp.add(tk);
      }
    }
    notifyListeners();
    return temp;
  }
}
