import 'package:flutter/material.dart';

import '../../../../domain/entities/joke.dart';
import '../../../widgets/network_image.dart';

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
          leading: LoadNetworkImage(
            joke.iconUrl,
            width: 50,
            height: 50,
          ),
          title: Text(joke.value),
        ),
      ),
    );
  }
}