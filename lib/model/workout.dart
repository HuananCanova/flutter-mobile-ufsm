import 'exercise.dart';

class Workout {
  String title;
  List<Exercise> exercises;

  Workout({required this.title, required this.exercises});

  // Método para salvar o treino
  void save() {
    // Lógica para salvar o treino em algum lugar (por exemplo, um banco de dados)
    print('Workout saved: $title');
    print('Exercises: ${exercises.map((exercise) => exercise.name).toList()}');
  }
}
