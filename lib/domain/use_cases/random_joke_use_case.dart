import 'package:dartz/dartz.dart';

import 'package:chuck_norris_jokes/data/failure.dart';
import 'package:chuck_norris_jokes/domain/entities/joke.dart';
import 'package:chuck_norris_jokes/domain/repositories/random_joke_repository.dart';

class RandomJokeUseCase {
  RandomJokeUseCase({
    required this.repository,
  });

  final RandomJokeRepository repository;

  Future<Either<Failure, Joke>> getRandomJoke() {
    return repository.getRandomJoke();
  }
}
