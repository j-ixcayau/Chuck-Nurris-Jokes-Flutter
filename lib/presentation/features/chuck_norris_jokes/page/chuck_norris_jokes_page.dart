import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../data/datasources/chuck_norris_jokes_data_source.dart';
import '../../../../data/repositories/random_joke_repository.dart';
import '../viewmodel/chuck_norris_jokes_view_model.dart';
import 'chuck_norris_jokes_layout.dart';

class ChuckNorrisJokesPage extends StatelessWidget {
  const ChuckNorrisJokesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChuckNorrisJokesViewModel>(
      create: (_) => ChuckNorrisJokesViewModel(
        repository: RandomJokeRepositoryImpl(
          datasource: ChuckNorrisJokesDataSourceImpl(),
        ),
      ),
      builder: (contex, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Chistes Chuck Norris'),
            centerTitle: true,
          ),
          body: const ChuckNorrisJokesLayout(),
        );
      },
    );
  }
}
