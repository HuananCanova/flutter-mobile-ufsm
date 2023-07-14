import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../database/logindao.dart';
import '../model/login.dart';

class LoginService{

  final String API_REST = "http://10.0.2.2:8080";

  Map<String, String> headers = <String, String>{
    "Content-type":"application/json",
  };


/*  String? tokenUsuarioLogado(){
    LoginDAO().getUsuarioLogado().then((value) {
      print("-->> token: "+value!.token);
      return value!.token;
    });
  }*/


  Future<bool> login( String login, String senha ) async{

    final conteudo = json.encode(<String, String>{'login': login, 'senha': senha});

    final resposta = await http.post(Uri.parse(API_REST+"/login"),headers: headers, body: conteudo);
    debugPrint("Status Code: "+resposta.statusCode.toString());
    debugPrint("valor: "+resposta.body.toString());

    if(resposta.statusCode == 200){

      Login usuarioLogado = Login.fromJson(jsonDecode(resposta.body));

      new LoginDAO().adicionar(usuarioLogado);
      return true;
    }

    return false;
  }

}