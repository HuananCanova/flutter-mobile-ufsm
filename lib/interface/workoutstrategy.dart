import '../model/exercise.dart';

abstract class WorkoutStrategy {
  List<Exercise> suggestExerciseList(List<Exercise> allExercises);
}