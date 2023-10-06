import 'package:flutter/material.dart';

import 'package:chuck_norris_jokes/domain/entities/joke.dart';
import 'package:chuck_norris_jokes/presentation/features/ask_for_old_age/page/ask_for_old_mayor_page.dart';
import 'package:chuck_norris_jokes/presentation/features/chuck_norris_jokes/page/chuck_norris_jokes_page.dart';
import 'package:chuck_norris_jokes/presentation/features/display_random_joke/page/display_random_joke_page.dart';
import 'package:chuck_norris_jokes/presentation/features/unknown/page/unknown_page.dart';
import 'package:chuck_norris_jokes/presentation/routes/route_names.dart';

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
