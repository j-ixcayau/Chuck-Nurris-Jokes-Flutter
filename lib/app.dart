import 'package:flutter/material.dart';

import 'package:chuck_norris_jokes/presentation/routes/route_names.dart';
import 'package:chuck_norris_jokes/presentation/routes/route_settings.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuck Norris Jokes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteNames.askForOldMayor,
      onGenerateRoute: RouteSetting.generate,
    );
  }
}
