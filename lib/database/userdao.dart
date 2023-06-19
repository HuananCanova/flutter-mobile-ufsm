import 'package:flutter/cupertino.dart';

import '../model/user.dart';

class UserDao{
  List<User> userList = [
    User( name: 'Huanan', email: 'hu@', password: '123'),
  ];


  bool verifyCredentials(String email, String password) {
    for (User user in UserDao().userList) {
      if (user.email == email && user.password == password) {
        return true;
      }
    }
    return false;
  }


  void addUser(User user){
    userList.add(user);
    debugPrint(user.email);
    debugPrint(user.password);
  }



}