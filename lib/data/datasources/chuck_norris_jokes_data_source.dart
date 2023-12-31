import 'dart:convert';

import 'package:flutter/widgets.dart';

import 'package:http/http.dart' as http;

import 'package:chuck_norris_jokes/data/constants.dart';
import 'package:chuck_norris_jokes/data/model/joke_model.dart';

abstract class ChuckNorrisJokesDataSource {
  Future<JokeModel?> requestJoke();
}

class ChuckNorrisJokesDataSourceImpl extends ChuckNorrisJokesDataSource {
  ChuckNorrisJokesDataSourceImpl({
    http.Client? httpClient,
  })  : _httpClient = httpClient ?? http.Client(),
        _url = AppUrls.url;

  final http.Client _httpClient;
  final Uri _url;

  @override
  Future<JokeModel?> requestJoke() async {
    try {
      final response =
          await _httpClient.get(_url).timeout(const Duration(seconds: 15));

      if (response.statusCode == 200) {
        final jokeJson = json.decode(response.body);

        return JokeModel.fromJson(jokeJson);
      }
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }

    throw Exception("Can't handle result");
  }
}
