import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../../domain/entities/joke.dart';
import '../viewmodel/display_random_joke_view_model.dart';
import 'display_random_joke_layout.dart';

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
            title: const Text('Chuck Norris Joke'),
            centerTitle: true,
          ),
          body: const DisplayRandomJokeLayout(),
        );
      },
    );
  }
}
