import 'package:chuck_norris_jokes/features/chucknurrisjokes/datasources/datasource/chuck_norris_jokes_data_source.dart';
import 'package:chuck_norris_jokes/features/chucknurrisjokes/datasources/model/joke.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

class MockClientTest extends Mock implements http.Client {}

void main() {
  late ChuckNorrisJokesDataSource sut;
  late MockClientTest httpClient;

  setUpAll(
    () {
      sut = ChuckNorrisJokesDataSourceImpl();
      httpClient = MockClientTest();

      registerFallbackValue(MockClientTest());
      registerFallbackValue(
          Uri.parse('https://api.chucknorris.io/jokes/random'));
    },
  );

  String _provideJsonRes() {
    return '''{
      "categories": [
        
      ],
      "created_at": "2020-01-05 13:42:30.480041",
      "icon_url": "https://assets.chucknorris.host/img/avatar/chuck-norris.png",
      "id": "KiF0RZkdRRmFV1bhUuEwOQ",
      "updated_at": "2020-01-05 13:42:30.480041",
      "url": "https://api.chucknorris.io/jokes/KiF0RZkdRRmFV1bhUuEwOQ",
      "value": "u know how there r ufo sightings those arent ufo's those r frisbees Chuck Norris threw"
    }''';
  }

  test(
    'verifySuccessHttp',
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

      expect(result, isA<Joke?>());
    },
  );

  test(
    'verifyFailureHttp',
    () async {
      when(
        () => httpClient.get(any()),
      ).thenThrow(Exception('oops'));

      final result = await sut.requestJoke();

      expect(result, isA<Joke?>());
    },
  );
}
