import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../domain/entities/joke.dart';
import '../constants.dart';

abstract class ChuckNorrisJokesDataSource {
  Future<Joke?> requestJoke();
}

class ChuckNorrisJokesDataSourceImpl extends ChuckNorrisJokesDataSource {
  ChuckNorrisJokesDataSourceImpl({
    http.Client? httpClient,
  })  : _httpClient = httpClient ?? http.Client(),
        _url = AppUrls.url;

  final http.Client _httpClient;
  final Uri _url;

  @override
  Future<Joke> requestJoke() async {
    try {
      final response =
          await _httpClient.get(_url).timeout(const Duration(seconds: 15));

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
