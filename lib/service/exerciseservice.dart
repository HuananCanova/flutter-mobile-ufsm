import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/exercise.dart';

class ExerciseService {

  final String API_REST = "http://192.168.15.28:8080";


  Map<String, String> headers = <String, String>{
    "Content-type": "application/json",
    "Accept-Charset": "utf-8",
  };

  Future<List<Exercise>> fetchExercises() async {
    final response = await http.get(
      Uri.parse(API_REST+"/exercise/list"), headers: headers
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((exerciseJson) => Exercise.fromJson(exerciseJson)).toList();
    } else {
      throw Exception('Failed to fetch exercises');
    }
  }

}
