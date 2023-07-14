import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/exercise.dart';
import '../model/workout.dart';

class WorkoutService{

  final String API_REST = "http://192.168.15.28:8080";

  Map<String, String> headers = <String, String>{
    "Content-type": "application/json",
    "Accept-Charset": "utf-8",
  };

  Future<bool> saveWorkout(String title, List<Exercise> exercises) async {
    try {
      // Criar o objeto do treino
      Workout workout = Workout(title: title, exercises: exercises);

      // Converter o objeto para JSON
      String workoutJson = jsonEncode(workout);

      final response = await http.post(
        Uri.parse(API_REST+"/workout/save"),
        headers: headers,
        body: workoutJson,
      );

      // Verificar o status code da resposta
      if (response.statusCode == 200) {
        // Treino salvo com sucesso
        return true;
      } else {
        // Ocorreu um erro ao salvar o treino
        return false;
      }
    } catch (e) {
      // Ocorreu uma exceção ao enviar a requisição
      print("Erro ao salvar o treino: $e");
      return false;
    }
  }

}