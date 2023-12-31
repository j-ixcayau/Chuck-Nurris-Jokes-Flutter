import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import 'package:chuck_norris_jokes/domain/entities/joke.dart';
import 'package:chuck_norris_jokes/presentation/features/display_random_joke/page/display_random_joke_layout.dart';
import 'package:chuck_norris_jokes/presentation/features/display_random_joke/view_model/display_random_joke_view_model.dart';

class DisplayRandomJokePage extends StatelessWidget {
  const DisplayRandomJokePage({
    Key? key,
    required this.joke,
  }) : super(key: key);

  final Joke joke;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DisplayRandomJokeViewModel>(
      create: (_) => DisplayRandomJokeViewModel(
        joke: joke,
      ),
      builder: (contex, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text('jokePage.appbarTitle'.tr()),
            centerTitle: true,
          ),
          body: const DisplayRandomJokeLayout(),
        );
      },
    );
  }
}
