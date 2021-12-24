import 'dart:convert';

import 'package:chuck_norris_jokes/features/chucknurrisjokes/datasources/model/joke.dart';
import 'package:http/http.dart' as http;

abstract class ChuckNorrisJokesDataSource {
  Future<Joke?> requestJoke();
}

class ChuckNorrisJokesDataSourceImpl extends ChuckNorrisJokesDataSource {
  @override
  Future<Joke> requestJoke() async {
    try {
      final url = Uri.parse('https://api.chucknorris.io/jokes/random');
      final response = await http.get(url).timeout(const Duration(seconds: 15));

      final jokeJson = json.decode(response.body);

      return Joke.fromJson(jokeJson);
    } catch (e) {
      print(e);

      rethrow;
    }
  }
}
