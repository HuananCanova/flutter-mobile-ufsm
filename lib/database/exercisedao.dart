import '../model/exercise.dart';


class ExerciseDao{
  static List<Exercise> exercises = [
    Exercise(id: 1, name: 'Supino', category: 'Peito'),
    Exercise(id: 2, name: 'Supino inclinado', category: 'Peito'),
    Exercise(id: 3, name: 'Elevação lateral', category: 'Ombros'),
    Exercise(id: 4, name: 'Elevação frontal', category: 'Ombros'),
    Exercise(id: 5, name: 'Rosca alternada', category: 'Bíceps'),
    Exercise(id: 6, name: 'Agachamento', category: 'Perna'),
    Exercise(id: 7, name: 'Crucifixo', category: 'Peito'),
    Exercise(id: 8, name: 'Prancha', category: 'Abs'),
  ];

  List<Exercise> getExerciseList(){
    return exercises;
  }
}