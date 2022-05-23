import 'package:flutter/material.dart';
import '../../datasources/model/joke.dart';

class ChuckNorrisJokeItem extends StatelessWidget {
  const ChuckNorrisJokeItem({
    Key? key,
    required this.joke,
  }) : super(key: key);

  final Joke joke;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
        leading: SizedBox(
          width: 80,
          height: 80,
          child: Image(
            image: NetworkImage(joke.iconUrl),
            width: 80,
            height: 80,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(joke.value),
      ),
    );
  }
}
