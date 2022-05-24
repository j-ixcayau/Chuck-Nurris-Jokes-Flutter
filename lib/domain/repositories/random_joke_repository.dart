import 'package:dartz/dartz.dart';

import '../../data/failure.dart';
import '../entities/joke.dart';

abstract class RandomJokeRepository {
  Future<Either<Failure, Joke>> getRandomJoke();
}
