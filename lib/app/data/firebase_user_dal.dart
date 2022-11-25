import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base_firebase/app/data/i_user_dal.dart';
import 'package:flutter_base_firebase/app/domain/entity/user.dart';

class FirebaseUserDal extends IUserDal {
  // var firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _usersCollection =
      FirebaseFirestore.instance.collection("users");

  @override
  addUser(User user) async {
    // TODO: implement addUser
    await _usersCollection.add(user.toMap());
  }

  // @override
  // Stream<List<User>> userList() {
  //   // TODO: implement userList
  //   print("home userList");

  //   return _usersCollection
  //       .orderBy("name", descending: true)
  //       .snapshots()
  //       .map((QuerySnapshot query) {
  //     List<User> retVal = [];
  //     retVal.add(User(id: 3, name: "deneme"));
  //     query.docs.forEach((element) {
  //       // retVal.add(User.fromJson(element.data()));
  //       print(element.data()!.toString());
  //     });
  //     return retVal;
  //   });
  // }

  @override
  Stream<List<User>> userList() {
    print("IRootService çalışıyor");
    return _usersCollection.snapshots().map((snapshot) {
      return snapshot.docs.map<User>((doc) {
        var data = doc.data();
        // return model.fromSnapshot(doc);
        print("#### data " + data.toString());
        return User.newFromSnapshot(doc);
      }).toList();
    });
  }

  @override
  Future<void> deleteUser(User u) async {
    await _usersCollection.doc(u.documentId).delete();
    // await _usersCollection.doc(u.documentId).update(); //Future<void> update(Map<String, Object?> data)
  }
}
