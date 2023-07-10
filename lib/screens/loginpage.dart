import 'package:fitness_track/screens/signuppage.dart';
import 'package:fitness_track/service/loginservice.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/textfield.dart';
import '../database/userdao.dart';
import '../model/user.dart';
import 'mainpage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  bool verifyCredentials(String email, String password) {
    for (User user in UserDao().userList) {
      if (user.email == email && user.password == password) {
        return true;
      }
    }
    return false;
  }

  void showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Loogin efetuado!', style: TextStyle(color: Colors.white, fontSize: 16),),
        backgroundColor: Colors.green,
      ),
    );
  }

  void signUserIn(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    new LoginService();


    // Verifica as credenciais
    if (verifyCredentials(email, password)) {
      showSuccessMessage(context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } else {
      // Exibe uma mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email ou senha inválido!', style: TextStyle(color: Colors.white, fontSize: 16),),
          backgroundColor: Colors.black,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          maintainBottomViewPadding: true,
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 45),
                const Icon(Icons.lock, size: 85),
                const SizedBox(height: 22),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                MyButton(
                  onTap: () {
                    signUserIn(context);
                  },
                  text: 'Sign In',
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                //CREATE ACCOUNT
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupPage()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Create account here.',
                        style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
