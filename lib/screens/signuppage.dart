import 'package:flutter/material.dart';

import '../components/button.dart';
import '../database/userdao.dart';
import '../model/user.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign up',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyTextSignUp(
                label: 'Name:',
                controller: _nameController,
                hintText: 'Name',
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              MyTextSignUp(
                label: 'Email:',
                controller: _emailController,
                hintText: 'Email',
                obscureText: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // You can add more complex email validation logic here if needed
                  return null;
                },
              ),
              const SizedBox(height: 8),
              MyTextSignUp(
                label: 'Password:',
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  // You can add more complex password validation logic here if needed
                  return null;
                },
              ),
              const SizedBox(height: 25),
              MyButton(
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    User user = new User(id: '0', name: _nameController.text, email: _emailController.text, password: _passwordController.text);
                    UserDao().addUser(user);
                    Navigator.of(context).pop();
                  }
                },
                text: "Sign Up",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextSignUp extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String label;
  final String? Function(String?)? validator;

  const MyTextSignUp({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.label,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Text(
            '$label',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(16),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[500]),
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}

