import '../../data/failure.dart';
import '../entities/joke.dart';
import '../repositories/random_joke_repository.dart';
import 'package:dartz/dartz.dart';

class RandomJokeUseCase {
  RandomJokeUseCase({
    required this.repository,
  });

  final RandomJokeRepository repository;

  Future<Either<Failure, Joke>> getRandomJoke() {
    return repository.getRandomJoke();
  }
}
