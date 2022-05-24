import 'package:flutter/widgets.dart';

import '../../../../domain/entities/joke.dart';

class DisplayRandomJokeViewModel extends ChangeNotifier {
  DisplayRandomJokeViewModel({
    required this.joke,
  });

  final Joke joke;
}
