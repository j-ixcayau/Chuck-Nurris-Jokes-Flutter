import 'package:dartz/dartz.dart';

import 'package:chuck_norris_jokes/data/failure.dart';
import 'package:chuck_norris_jokes/domain/entities/joke.dart';

abstract class RandomJokeRepository {
  Future<Either<Failure, Joke>> getRandomJoke();
}
