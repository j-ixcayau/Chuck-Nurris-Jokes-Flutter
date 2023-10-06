import 'package:flutter/material.dart';

import 'package:chuck_norris_jokes/domain/entities/joke.dart';
import 'package:chuck_norris_jokes/presentation/utils/constants/assets_paths.dart';

class ChuckNorrisJokeItem extends StatelessWidget {
  const ChuckNorrisJokeItem({
    Key? key,
    required this.joke,
    required this.onTap,
  }) : super(key: key);

  final Joke joke;
  final Function(Joke) onTap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: joke.id,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        child: ListTile(
          onTap: () {
            onTap(joke);
          },
          contentPadding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
          leading: const Image(
            image: AssetImage(
              AssetPaths.chuckNorris,
            ),
            width: 50,
            height: 50,
          ),
          title: Text(joke.value),
        ),
      ),
    );
  }
}
