import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_creation/features/chucknurrisjokes/datasources/datasource/chuck_norris_jokes_data_source.dart';
import 'package:test_creation/features/chucknurrisjokes/datasources/repository/chuck_norris_jokes_repository.dart';
import 'package:test_creation/features/chucknurrisjokes/presentation/bloc/chuck_norris_jokes_provider.dart';
import 'package:test_creation/features/chucknurrisjokes/presentation/page/chuck_norris_jokes_layout.dart';

class CuchNorrisJokesPage extends StatefulWidget {
  const CuchNorrisJokesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CuchNorrisJokesPage> createState() => _CuchNorrisJokesPageState();
}

class _CuchNorrisJokesPageState extends State<CuchNorrisJokesPage> {
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
