import 'package:flutter/material.dart';

import '../../data/my_user_data.dart';

class UserAuthProvider extends ChangeNotifier {
  MyUser? currentUser;

  void updateUser(MyUser newUser) {
    currentUser = newUser;
    notifyListeners();
  }
}
