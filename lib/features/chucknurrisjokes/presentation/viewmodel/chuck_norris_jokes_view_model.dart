import 'package:flutter/material.dart';

import '../../datasources/model/joke.dart';
import '../../datasources/repository/chuck_norris_jokes_repository.dart';

class ChuckNorrisJokesViewModel extends ChangeNotifier {
  ChuckNorrisJokesViewModel({
    required ChuckNorrisJokesRepository? repository,
  })   : assert(repository != null),
        _repository = repository! {
    _initProvider();
  }

  final ChuckNorrisJokesRepository _repository;
  List<Joke> jokes = [];

  void _initProvider() => _fetchNewJoke();

  void _fetchNewJoke() {
    if (jokes.length <= 14) {
      _requestNewJoke();
    }
  }

  void _requestNewJoke() async {
    final result = await _repository.requestJoke();
    if (result != null) {
      final jokeIndex = jokes.indexWhere((it) => it.id == result.id);

      if (jokeIndex == -1) {
        jokes.add(result);

        notifyListeners();
      }
    }

    _fetchNewJoke();
  }
}
