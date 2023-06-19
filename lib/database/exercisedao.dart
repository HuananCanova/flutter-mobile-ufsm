import '../model/exercise.dart';

class ExerciseDao{
  static List<Exercise> exercises = [
    Exercise(id: 1, name: 'Supino', category: 'Peito'),
    Exercise(id: 2, name: 'Elevação lateral', category: 'Ombros'),
    Exercise(id: 3, name: 'Agachamento', category: 'Perna'),
    Exercise(id: 4, name: 'Crucifixo', category: 'Peito'),
    Exercise(id: 5, name: 'Prancha', category: 'Abs'),
  ];

  List<Exercise> getExerciseList(){
    return exercises;
  }
}