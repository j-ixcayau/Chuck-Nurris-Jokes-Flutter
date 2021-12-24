import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../datasources/datasource/chuck_norris_jokes_data_source.dart';
import '../../datasources/repository/chuck_norris_jokes_repository.dart';
import '../bloc/chuck_norris_jokes_provider.dart';
import 'chuck_norris_jokes_layout.dart';

class ChuckNorrisJokesPage extends StatelessWidget {
  const ChuckNorrisJokesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChuckNorrisJokesProvider>(
      create: (_) => ChuckNorrisJokesProvider(
        repository: ChuckNorrisJokesRepositoryImpl(
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
