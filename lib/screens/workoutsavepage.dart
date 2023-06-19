import 'package:fitness_track/components/button.dart';
import 'package:fitness_track/screens/workoutlistpage.dart';
import 'package:flutter/material.dart';
import '../database/workoutdao.dart';
import '../model/exercise.dart';
import '../model/workout.dart';

class WorkoutSavePage extends StatelessWidget {
  final List<Exercise> selectedExercises;

  WorkoutSavePage(this.selectedExercises);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();

    void saveWorkout() {
      String workoutTitle = titleController.text;

      if (workoutTitle.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Insira um título!', style: TextStyle(fontSize: 16),),
            duration: Duration(seconds: 2),
            backgroundColor: Colors.black,

          ),
        );
      } else {
        Workout workout = Workout(title: workoutTitle, exercises: selectedExercises);
        WorkoutDao.addWorkout(workout);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WorkoutListPage(),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Save Workout',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: const BackButton(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Título do treino: ',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Exercícios selecionados:',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: selectedExercises.length,
                itemBuilder: (context, index) {
                  Exercise exercise = selectedExercises[index];
                  return ListTile(
                    title: Text(exercise.name, style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text('Grupo: ' + exercise.category),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            MyButton(
              text: "Criar treino",
              onTap: saveWorkout,
            ),
          ],
        ),
      ),
    );
  }
}

