import 'package:chuck_norris_jokes/data/datasources/chuck_norris_jokes_data_source.dart';
import 'package:chuck_norris_jokes/data/model/joke_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockClientTest extends Mock implements http.Client {}

void main() {
  /*
  * Helper fields
  */
  final uriJokes = Uri.parse('https://api.chucknorris.io/jokes/random');
  const jokeContent =
      "u know how there r ufo sightings those arent ufo's those r frisbees Chuck Norris threw";
  const failure500Text =
      '12390-adfjlzxcvklj3q4m52/asdfj234509jaskd.,mzxcv awupqwe';

  /*
  * Vars
  */
  late ChuckNorrisJokesDataSource sut;
  late MockClientTest httpClient;

  setUpAll(
    () {
      httpClient = MockClientTest();
      sut = ChuckNorrisJokesDataSourceImpl(
        httpClient: httpClient,
      );

      registerFallbackValue(uriJokes);
    },
  );

  String _provideJsonRes() {
    return '''{
      "categories": [],
      "created_at": "2020-01-05 13:42:30.480041",
      "icon_url": "https://assets.chucknorris.host/img/avatar/chuck-norris.png",
      "id": "KiF0RZkdRRmFV1bhUuEwOQ",
      "updated_at": "2020-01-05 13:42:30.480041",
      "url": "https://api.chucknorris.io/jokes/KiF0RZkdRRmFV1bhUuEwOQ",
      "value": "$jokeContent"
    }''';
  }

  test(
    'verifyHttpGetCall_whenAppStart_onAppFlow',
    () async {
      final expectedJson = _provideJsonRes();

      when(
        () => httpClient.get(any()),
      ).thenAnswer(
        (_) async {
          return http.Response(expectedJson, 200);
        },
      );

      final result = await sut.requestJoke();

      verify(() => httpClient.get(uriJokes)).called(1);
    },
  );

  test(
    'verifySuccessResponse_whenAppStart_onAppFlow',
    () async {
      final expectedJson = _provideJsonRes();

      when(
        () => httpClient.get(any()),
      ).thenAnswer(
        (_) async {
          return http.Response(expectedJson, 200);
        },
      );

      final result = await sut.requestJoke();

      expect(result, isA<JokeModel?>());
      expect(result, isNotNull);
      expect(result!.value, jokeContent);
    },
  );

  test(
    'verify500Response_whenAppStart_onAppFlow',
    () async {
      when(
        () => httpClient.get(any()),
      ).thenAnswer(
        (_) async {
          return http.Response(failure500Text, 500);
        },
      );

      expect(sut.requestJoke(), throwsException);
    },
  );

  test(
    'verifyFailureResponse_whenAppStart_onAppFlow',
    () async {
      when(
        () => httpClient.get(any()),
      ).thenThrow(
        Exception('oops'),
      );

      expect(sut.requestJoke(), throwsException);
    },
  );
}
