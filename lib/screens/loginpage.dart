import 'package:fitness_track/screens/signuppage.dart';
import 'package:flutter/material.dart';
import '../components/button.dart';
import '../components/textfield.dart';
import '../database/userdao.dart';
import '../model/user.dart';
import 'mainpage.dart'; // Importe a página de cadastro de usuário aqui

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool verifyCredentials(String email, String password) {
    // Itera sobre a lista de usuários
    for (User user in UserDao().userList) {
      if (user.email == email && user.password == password) {
        return true; // Credenciais correspondem a uma conta existente
      }
    }
    return false; // Credenciais não correspondem a nenhuma conta existente
  }

  void signUserIn(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    // Verifica as credenciais
    if (verifyCredentials(email, password)) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    } else {
      // Exibe uma mensagem de erro
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Invalid Credentials"),
          content: Text("Please enter valid email and password."),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
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
      body: SafeArea(
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
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
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
    );
  }
}
