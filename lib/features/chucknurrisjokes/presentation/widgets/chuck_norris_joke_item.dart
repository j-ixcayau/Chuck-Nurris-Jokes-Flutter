import 'package:flutter/material.dart';
import 'package:test_creation/features/chucknurrisjokes/datasources/model/joke.dart';

class ChuckNorrisJokeItem extends StatelessWidget {
  const ChuckNorrisJokeItem({
    Key? key,
    required this.joke,
  }) : super(key: key);

  final Joke joke;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(joke.iconUrl),
      title: Text(joke.value),
    );
  }
}
