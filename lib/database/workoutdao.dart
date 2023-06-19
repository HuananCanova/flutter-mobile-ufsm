
import '../model/workout.dart';

class WorkoutDao {
  static List<Workout> workoutList = [];

  static void addWorkout(Workout workout) {
    workoutList.add(workout);
  }

  static void removeWorkout(Workout workout){
    workoutList.remove(workout);
  }
}
