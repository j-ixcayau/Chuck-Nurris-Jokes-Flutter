import 'package:chuck_norris_jokes/data/datasources/chuck_norris_jokes_data_source.dart';
import 'package:chuck_norris_jokes/data/failure.dart';
import 'package:chuck_norris_jokes/data/repositories/random_joke_repository.dart';
import 'package:chuck_norris_jokes/domain/entities/joke.dart';
import 'package:chuck_norris_jokes/domain/repositories/random_joke_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ChuckNorrisJokesDataSourceTest extends Mock
    implements ChuckNorrisJokesDataSource {}

void main() {
  late ChuckNorrisJokesDataSourceTest dataSource;
  late RandomJokeRepository sut;

  setUpAll(
    () {
      dataSource = ChuckNorrisJokesDataSourceTest();
      sut = RandomJokeRepositoryImpl(
        datasource: dataSource,
      );
    },
  );

  Future<Either<Failure, Joke>> _provideRightResult() {
    final joke = Joke(
      iconUrl: 'www.image.com',
      id: '1',
      value: 'Joke conten',
      url: 'www.google.com',
    );

    return Future.value(Right(joke));
  }

  Future<Either<Failure, Joke>> _provideLeftResult() {
    const failure = UnknowFailure();

    return Future.value(const Left(failure));
  }

  test('verifyDataSourceCall_whenAppStart_onAppFlow', () async {
    when(
      () => sut.getRandomJoke(),
    ).thenAnswer(
      (_) async {
        return _provideRightResult();
      },
    );

    final result = await sut.getRandomJoke();

    verify(() => dataSource.requestJoke()).called(1);
  });

  test(
    'verifySucess_whenAppStart_onAppFlow',
    () async {
      final expectedResult = _provideRightResult();

      when(
        () => sut.getRandomJoke(),
      ).thenAnswer(
        (_) async {
          return expectedResult;
        },
      );

      final result = await sut.getRandomJoke();

      expect(result, isA<Joke>());
      expect(result, await expectedResult);
    },
  );

  test(
    'verifyFailure_whenAppStart_onAppFlow',
    () async {
      final expectedResult = _provideLeftResult();

      when(
        () => sut.getRandomJoke(),
      ).thenAnswer((_) async {
        return expectedResult;
      });

      final result = await sut.getRandomJoke();

      expect(result, expectedResult);
    },
  );
}
