import '../interface/workoutstrategy.dart';
import 'exercise.dart';

class Workout {
  String title;
  List<Exercise> exercises;
  //WorkoutStrategy strategy;

  Workout({required this.title, required this.exercises});


}

class TimeWorkoutStrategy implements WorkoutStrategy {
  @override
  List<Exercise> suggestExerciseList(List<Exercise> allExercises) {
    // Lógica para sugerir mais exercícios com base no tempo
    // Por exemplo, retornar uma lista com mais exercícios
    return allExercises;
  }
}

// Implementação da estratégia para treinos baseados em peso
class WeightWorkoutStrategy implements WorkoutStrategy {
  @override
  List<Exercise> suggestExerciseList(List<Exercise> allExercises) {
    // Lógica para sugerir menos exercícios com base no peso
    // Por exemplo, retornar uma lista com menos exercícios
    return allExercises;
  }
}
