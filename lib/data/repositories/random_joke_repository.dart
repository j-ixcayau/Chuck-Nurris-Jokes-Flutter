import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../domain/entities/joke.dart';
import '../../domain/repositories/random_joke_repository.dart';
import '../datasources/chuck_norris_jokes_data_source.dart';
import '../exception.dart';
import '../failure.dart';

class RandomJokeRepositoryImpl extends RandomJokeRepository {
  RandomJokeRepositoryImpl({
    required ChuckNorrisJokesDataSource datasource,
  }) : _datasource = datasource;

  final ChuckNorrisJokesDataSource _datasource;

  @override
  Future<Either<Failure, Joke>> getRandomJoke() async {
    try {
      final result = await _datasource.requestJoke();

      if (result != null) {
        return Right(result.toEntity());
      }
    } on ServerException {
      return const Left(ServerFailure());
    } on SocketException {
      return const Left(ConnectionFailure());
    }

    return const Left(UnknowFailure());
  }
}
