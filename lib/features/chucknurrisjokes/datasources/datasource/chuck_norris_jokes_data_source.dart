import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/joke.dart';

abstract class ChuckNorrisJokesDataSource {
  Future<Joke?> requestJoke();
}

class ChuckNorrisJokesDataSourceImpl extends ChuckNorrisJokesDataSource {
  ChuckNorrisJokesDataSourceImpl({
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  @override
  Future<Joke> requestJoke() async {
    try {
      final url = Uri.parse('https://api.chucknorris.io/jokes/random');
      final response =
          await _httpClient.get(url).timeout(const Duration(seconds: 15));

      final body = response.body;

      if (response.statusCode == 200) {
        final jokeJson = json.decode(response.body);

        return Joke.fromJson(jokeJson);
      }
    } catch (e) {
      print(e);

      rethrow;
    }

    throw Exception("Can't handle result");
  }
}
