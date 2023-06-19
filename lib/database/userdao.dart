import 'package:flutter/cupertino.dart';

import '../model/user.dart';

class UserDao{
  List<User> userList = [
    User(id: '1', name: 'Huanan', email: 'hu@', password: '123'),
  ];


  bool verifyCredentials(String email, String password) {
    // Itera sobre a lista de usuários
    for (User user in UserDao().userList) {
      if (user.email == email && user.password == password) {
        return true; // Credenciais correspondem a uma conta existente
      }
    }
    return false; // Credenciais não correspondem a nenhuma conta existente
  }


  void addUser(User user){
    userList.add(user);
    debugPrint(user.id);
    debugPrint(user.name);
    debugPrint(user.email);
    debugPrint(user.password);
  }



}