import 'package:flutter/material.dart';

import '../features/chucknurrisjokes/presentation/page/chuck_norris_jokes_page.dart';
import '../features/uknow/presentation/unknown/unknown_page.dart';
import 'route_names.dart';

class RouteSetting {
  static Route<dynamic> generate(RouteSettings settings) {
    dynamic page;
    String name = settings.name!;

    switch (name) {
      case RouteNames.home:
        page = const ChuckNorrisJokesPage();
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
