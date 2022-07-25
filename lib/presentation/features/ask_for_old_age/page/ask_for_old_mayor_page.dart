import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/ask_for_old_mayor_view_model.dart';
import 'ask_for_old_mayor_layout.dart';

class AskForOldMayorPage extends StatelessWidget {
  const AskForOldMayorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AskForOldMayorViewModel>(
      create: (_) => AskForOldMayorViewModel(
        context: context,
      ),
      builder: (contex, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Chuck Norris Jokes'),
            centerTitle: true,
          ),
          body: const AskForOldMayorLayout(),
        );
      },
    );
  }
}