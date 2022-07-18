import 'package:flutter/material.dart';

import '../../domain/entities/joke.dart';
import '../features/ask_for_old_age/page/ask_for_old_mayor_page.dart';
import '../features/chuck_norris_jokes/page/chuck_norris_jokes_page.dart';
import '../features/display_random_joke/page/display_random_joke_page.dart';
import '../features/unknown/page/unknown_page.dart';
import 'route_names.dart';

class RouteSetting {
  static Route<dynamic> generate(RouteSettings settings) {
    dynamic page;

    String name = settings.name!;
    dynamic args = settings.arguments;

    switch (name) {
      case RouteNames.askForOldMayor:
        page = const AskForOldMayorPage();
        break;
      case RouteNames.jokesList:
        page = const ChuckNorrisJokesPage();
        break;
      case RouteNames.singleJoke:
        final joke = args as Joke;

        page = DisplayRandomJokePage(
          joke: joke,
        );
        break;
      default:
        page = const UnknownPage();
    }

    return MaterialPageRoute(
      settings: RouteSettings(
        name: name,
        arguments: settings.arguments,
      ),
      builder: (_) => page,
    );
  }
}
