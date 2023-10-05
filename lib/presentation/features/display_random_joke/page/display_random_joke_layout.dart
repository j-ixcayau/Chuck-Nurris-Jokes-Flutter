import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:chuck_norris_jokes/presentation/features/display_random_joke/view_model/display_random_joke_view_model.dart';
import 'package:chuck_norris_jokes/presentation/utils/constants/assets_paths.dart';

class DisplayRandomJokeLayout extends StatelessWidget {
  const DisplayRandomJokeLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DisplayRandomJokeViewModel>(
      builder: (context, model, _) {
        return Container(
          padding: const EdgeInsets.all(24),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: model.joke.id,
                child: const Image(
                  image: AssetImage(
                    AssetPaths.chuckNorris,
                  ),
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                model.joke.value,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
    );
  }
}
