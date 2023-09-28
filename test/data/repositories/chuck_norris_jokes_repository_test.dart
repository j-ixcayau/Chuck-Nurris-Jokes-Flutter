import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:chuck_norris_jokes/data/datasources/chuck_norris_jokes_data_source.dart';
import 'package:chuck_norris_jokes/data/model/joke_model.dart';
import 'package:chuck_norris_jokes/data/repositories/random_joke_repository.dart';
import 'package:chuck_norris_jokes/domain/repositories/random_joke_repository.dart';

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

  Future<JokeModel?> provideSuccessJokeModelResult() async {
    const joke = JokeModel(
      iconUrl: 'www.image.com',
      id: '1',
      value: 'Joke content',
      url: 'www.google.com',
    );

    await Future.delayed(Duration.zero);

    return joke;
  }

  Future<JokeModel?> provideFailureJokeModelResult() async {
    return Future.value(null);
  }

  test(
    'verifyDataSourceCall_whenAppStart_onAppFlow',
    () async {
      when(
        () => dataSource.requestJoke(),
      ).thenAnswer(
        (_) async => provideSuccessJokeModelResult(),
      );

      final result = await sut.getRandomJoke();

      expect(result, isNotNull);
      verify(() => dataSource.requestJoke()).called(1);
    },
  );

  test(
    'verifySucess_whenAppStart_onAppFlow',
    () async {
      final entityJoke = provideSuccessJokeModelResult();
      final joke = (await entityJoke)!.toEntity();

      when(
        () => dataSource.requestJoke(),
      ).thenAnswer(
        (_) async => entityJoke,
      );

      final result = await sut.getRandomJoke();

      expect(result, isA<Right>());

      expect(result.isRight(), isTrue);
      expect(result.isLeft(), false);

      expect(result, equals(Right(joke)));
    },
  );

  test(
    'verifyFailure_whenAppStart_onAppFlow',
    () async {
      final entityJoke = provideFailureJokeModelResult();

      when(
        () => dataSource.requestJoke(),
      ).thenAnswer(
        (_) async => entityJoke,
      );

      final result = await sut.getRandomJoke();

      expect(result, isA<Left>());

      expect(result.isLeft(), isTrue);
      expect(result.isRight(), isFalse);
    },
  );
}
