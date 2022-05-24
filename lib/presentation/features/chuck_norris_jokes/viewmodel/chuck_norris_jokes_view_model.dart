import 'package:flutter/material.dart';

import '../../../../domain/entities/joke.dart';
import '../../../../domain/repositories/random_joke_repository.dart';

class ChuckNorrisJokesViewModel extends ChangeNotifier {
  ChuckNorrisJokesViewModel({
    required RandomJokeRepository repository,
  }) : _repository = repository {
    _initProvider();
  }

  final RandomJokeRepository _repository;
  List<Joke> jokes = [];

  void _initProvider() => _fetchNewJoke();

  void _fetchNewJoke() {
    if (jokes.length <= 14) {
      _requestNewJoke();
    }
  }

  void _requestNewJoke() async {
    final result = await _repository.getRandomJoke();

    result.fold(
      (l) {},
      (r) {
        final jokeIndex = jokes.indexWhere((it) => it.id == r.id);

        if (jokeIndex == -1) {
          jokes.add(r);

          notifyListeners();
        }
      },
    );

    _fetchNewJoke();
  }
}
