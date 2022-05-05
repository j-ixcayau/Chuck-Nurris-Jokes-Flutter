import '../datasource/chuck_norris_jokes_data_source.dart';
import '../model/joke.dart';

abstract class ChuckNorrisJokesRepository {
  Future<Joke?> requestJoke();
}

class ChuckNorrisJokesRepositoryImpl extends ChuckNorrisJokesRepository {
  ChuckNorrisJokesRepositoryImpl({
    required ChuckNorrisJokesDataSource? datasource,
  })   : assert(datasource != null),
        _datasource = datasource!;

  final ChuckNorrisJokesDataSource _datasource;

  @override
  Future<Joke?> requestJoke() async {
    try {
      return await _datasource.requestJoke();
    } catch (e) {
      print(e);
    }

    return null;
  }
}
