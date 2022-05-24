import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            Hero(
              tag: model.joke.id,
              child: Text(model.joke.value),
            ),
          ],
        );
      },
    );
  }
}
