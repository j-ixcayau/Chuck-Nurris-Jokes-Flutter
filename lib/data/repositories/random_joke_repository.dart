import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:chuck_norris_jokes/data/datasources/chuck_norris_jokes_data_source.dart';
import 'package:chuck_norris_jokes/data/exception.dart';
import 'package:chuck_norris_jokes/data/failure.dart';
import 'package:chuck_norris_jokes/domain/entities/joke.dart';
import 'package:chuck_norris_jokes/domain/repositories/random_joke_repository.dart';

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
