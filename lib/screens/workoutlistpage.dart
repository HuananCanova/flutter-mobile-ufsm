import 'package:fitness_track/components/button.dart';
import 'package:flutter/material.dart';
import '../database/workoutdao.dart';
import '../model/workout.dart';
import 'exerciseselectionpage.dart';
import 'mainpage.dart';

class WorkoutListPage extends StatefulWidget {
  @override
  _WorkoutListPageState createState() => _WorkoutListPageState();
}

class _WorkoutListPageState extends State<WorkoutListPage> {
  List<Workout> selectedWorkouts = [];

  void toggleWorkoutSelection(Workout workout) {
    setState(() {
      if (selectedWorkouts.contains(workout)) {
        selectedWorkouts.remove(workout);
      } else {
        selectedWorkouts.add(workout);
      }
    });
  }

  void removeSelectedWorkouts() {
    setState(() {
      for (Workout workout in selectedWorkouts) {
        WorkoutDao.removeWorkout(workout);
      }
      selectedWorkouts.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Meus treinos',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MainPage(),
              ),
            );
          },
        ),
      ),
      body: WorkoutDao.workoutList.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nenhum treino encontrado',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            MyButton(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ExerciseSelectionPage(),
                  ),
                );
              },
              text: 'Criar treino',
            ),
          ],
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView.builder(
          itemCount: WorkoutDao.workoutList.length,
          itemBuilder: (context, index) {
            Workout workout = WorkoutDao.workoutList[index];
            bool isSelected = selectedWorkouts.contains(workout);
            return Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Card(
                elevation: 20,
                child: ListTile(
                  title: Row(
                    children: [
                      Icon(
                        isSelected ? Icons.check_circle : Icons.check_circle_outline,
                        color: isSelected ? Colors.green : Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text(
                        workout.title,
                        style: TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: workout.exercises
                          .map((exercise) => Text(exercise.name))
                          .toList(),
                    ),
                  ),
                  tileColor: isSelected ? Colors.grey[300] : null,
                  onTap: () => toggleWorkoutSelection(workout),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: selectedWorkouts.isEmpty ? null : removeSelectedWorkouts,
        child: Icon(Icons.check, color: Colors.white, size: 40),
        backgroundColor: Colors.green,
      ),
    );
  }
}
