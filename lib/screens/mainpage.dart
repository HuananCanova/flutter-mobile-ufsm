import 'package:flutter/material.dart';
import 'exerciseselectionpage.dart';
import 'loginpage.dart';
import 'workoutlistpage.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Main',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15),
            child: IconButton(
              icon: Icon(Icons.logout_outlined),
              color: Colors.white,
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/homepicture.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 60),
            Text(
              "Menu",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 1.5, color: Colors.white),
            ),
            const SizedBox(height: 70),
            _CardMain(
              title: "Exercícios",
              onClick: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ExerciseSelectionPage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
            _CardMain(
              title: "Treinos",
              onClick: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WorkoutListPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _CardMain extends StatelessWidget {
  final String title;
  final VoidCallback onClick;

  _CardMain({required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Card(
        elevation: 40,
        semanticContainer: true,
        shadowColor: Colors.black.withOpacity(1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: onClick,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    letterSpacing: 2,
                    color: Colors.black,
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
