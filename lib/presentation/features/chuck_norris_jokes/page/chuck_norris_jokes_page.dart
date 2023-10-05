import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:chuck_norris_jokes/data/datasources/chuck_norris_jokes_data_source.dart';
import 'package:chuck_norris_jokes/data/repositories/random_joke_repository.dart';
import 'package:chuck_norris_jokes/presentation/features/chuck_norris_jokes/page/chuck_norris_jokes_layout.dart';
import 'package:chuck_norris_jokes/presentation/features/chuck_norris_jokes/view_model/chuck_norris_jokes_view_model.dart';

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
            title: Text('jokesListPage.appbarTitle'.tr()),
            centerTitle: true,
          ),
          body: const ChuckNorrisJokesLayout(),
        );
      },
    );
  }
}
