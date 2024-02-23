import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/my_user_data.dart';

class FirebaseUtils {
  static CollectionReference<MyUser> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.collectionName)
        .withConverter<MyUser>(
            fromFirestore: (snapshot, options) =>
                MyUser.fromFireStore(snapshot.data()),
            toFirestore: (user, options) => user.toFireStore());
  }

  static Future<void> addUserToFireStore(MyUser myUser) {
    return getUsersCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUserFromFireStore(String uId) async {
    var querySnapShot = await getUsersCollection().doc(uId).get();
    return querySnapShot.data();
  }
}
