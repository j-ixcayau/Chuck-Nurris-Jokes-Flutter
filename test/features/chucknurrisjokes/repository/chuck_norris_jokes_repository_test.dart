import 'package:chuck_norris_jokes/features/chucknurrisjokes/datasources/datasource/chuck_norris_jokes_data_source.dart';
import 'package:chuck_norris_jokes/features/chucknurrisjokes/datasources/model/joke.dart';
import 'package:chuck_norris_jokes/features/chucknurrisjokes/datasources/repository/chuck_norris_jokes_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ChuckNorrisJokesDataSourceTest extends Mock
    implements ChuckNorrisJokesDataSource {}

void main() {
  late ChuckNorrisJokesDataSourceTest dataSource;
  late ChuckNorrisJokesRepository sut;

  setUpAll(
    () {
      dataSource = ChuckNorrisJokesDataSourceTest();
      sut = ChuckNorrisJokesRepositoryImpl(
        datasource: dataSource,
      );
    },
  );

  Future<Joke?> _provideFutureJoke() {
    final joke = Joke(
      iconUrl: 'www.image.com',
      id: '1',
      value: 'Joke conten',
      url: 'www.google.com',
    );

    return Future.value(joke);
  }

  test('verifyDataSourceCall_whenAppStart_onAppFlow', () async {
    when(
      () => sut.requestJoke(),
    ).thenAnswer(
      (_) async {
        return _provideFutureJoke();
      },
    );

    final result = await sut.requestJoke();

    verify(() => dataSource.requestJoke()).called(1);
  });

  test(
    'verifySucess_whenAppStart_onAppFlow',
    () async {
      final expectedResult = _provideFutureJoke();

      when(
        () => sut.requestJoke(),
      ).thenAnswer(
        (_) async {
          return expectedResult;
        },
      );

      final result = await sut.requestJoke();

      expect(result, isA<Joke>());
      expect(result, await expectedResult);
    },
  );

  test(
    'verifyFailure_whenAppStart_onAppFlow',
    () async {
      when(
        () => sut.requestJoke(),
      ).thenThrow(
        Exception('oops'),
      );

      final result = await sut.requestJoke();

      expect(result, isNull);
    },
  );
}
