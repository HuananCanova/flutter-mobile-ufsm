import 'package:flutter/material.dart';


import '../components/button.dart';
import 'loginpage.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset('assets/images/homepicture.jpg', width: 400),
              const SizedBox(height: 40),
              Text('Welcome to \n Fit Tracker',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Anton',
                ),
              ),
              const SizedBox(height: 70),
              MyButton(onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => LoginPage()
                  ),
                );
              }, text: 'Access account'),
            ],
          ),
        ),
      ),
    );
  }
}


