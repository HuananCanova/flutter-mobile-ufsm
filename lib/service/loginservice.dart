import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../database/logindao.dart';
import '../model/login.dart';

class LoginService{

  final String API_REST = "http://192.168.15.28:8080";

  Map<String, String> headers = <String, String>{
    "Content-type":"application/json",
  };


  Future<bool> login(String login, String senha) async {
    final conteudo = json.encode(<String, String>{'login': login, 'senha': senha});

    final response = await http.post(Uri.parse(API_REST + "/login"), headers: headers, body: conteudo);
    debugPrint("Status Code: " + response.statusCode.toString());
    debugPrint("valor: " + response.body.toString());

    if (response.statusCode == 200) {
      Login usuarioLogado = Login.fromJson(jsonDecode(response.body));

      // Salvar o token JWT no SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', usuarioLogado.token);

      return true;
    }

    return false;
  }

}