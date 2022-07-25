import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../chuck_norris_jokes/widgets/chuck_norris_joke_item.dart';
import '../viewmodel/display_random_joke_view_model.dart';

class DisplayRandomJokeLayout extends StatelessWidget {
  const DisplayRandomJokeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DisplayRandomJokeViewModel>(
      builder: (context, model, _) {
        return Column(
          children: [
            ChuckNorrisJokeItem(
              joke: model.joke,
              onTap: (joke) {},
            ),
          ],
        );
      },
    );
  }
}
