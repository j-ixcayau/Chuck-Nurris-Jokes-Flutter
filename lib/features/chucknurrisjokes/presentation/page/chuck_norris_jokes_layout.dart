import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chuck_norris_jokes/features/chucknurrisjokes/presentation/bloc/chuck_norris_jokes_provider.dart';
import 'package:chuck_norris_jokes/features/chucknurrisjokes/presentation/widgets/chuck_norris_joke_item.dart';

class ChuckNorrisJokesLayout extends StatelessWidget {
  const ChuckNorrisJokesLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChuckNorrisJokesProvider>(
      builder: (context, model, _) {
        return Container(
          margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: ListView.builder(
            itemCount: model.jokes.length,
            itemBuilder: (context, i) {
              return ChuckNorrisJokeItem(
                joke: model.jokes[i],
              );
            },
          ),
        );
      },
    );
  }
}
