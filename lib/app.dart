import 'package:flutter/material.dart';

import 'features/chucknurrisjokes/presentation/page/chuck_norris_jokes_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuck Norris Jokes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CuchNorrisJokesPage(),
    );
  }
}
