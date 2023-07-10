import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/exercise.dart';

class ExerciseSelectionPage extends StatefulWidget {
  @override
  _ExerciseSelectionPageState createState() => _ExerciseSelectionPageState();
}

class _ExerciseSelectionPageState extends State<ExerciseSelectionPage> {
  List<Exercise> exercises = [];
  List<Exercise> selectedExercises = [];

  @override
  void initState() {
    super.initState();
    fetchExercises();
  }

  Future<void> fetchExercises() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8080/exercise'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<Exercise> fetchedExercises = [];
      for (var exerciseData in data) {
        Exercise exercise = Exercise(
          id: exerciseData['id'],
          name: exerciseData['name'],
          category: exerciseData['category'],
        );
        fetchedExercises.add(exercise);
      }
      setState(() {
        exercises = fetchedExercises;
      });
    }
  }

  void toggleExerciseSelection(Exercise exercise) {
    setState(() {
      if (selectedExercises.contains(exercise)) {
        selectedExercises.remove(exercise);
      } else {
        selectedExercises.add(exercise);
      }
    });
  }

  void navigateToWorkoutSavePage() {
    if (selectedExercises.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Selecione pelo menos um exercício.',
            style: TextStyle(fontSize: 16),
          ),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.black,
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WorkoutSavePage(selectedExercises),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exercícios',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'Lista de Exercícios',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Divider(
            thickness: 5,
            color: Colors.grey,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                Exercise exercise = exercises[index];
                bool isSelected = selectedExercises.contains(exercise);

                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        exercise.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('Grupo: ' + exercise.category),
                      trailing: isSelected
                          ? Icon(Icons.check_circle, color: Colors.green)
                          : Icon(Icons.check_circle),
                      onTap: () => toggleExerciseSelection(exercise),
                    ),
                    Divider(
                      height: 0,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToWorkoutSavePage,
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.black,
      ),
    );
  }
}
