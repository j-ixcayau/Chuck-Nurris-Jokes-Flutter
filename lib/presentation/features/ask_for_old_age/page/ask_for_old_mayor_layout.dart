import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/ask_for_old_mayor_view_model.dart';

class AskForOldMayorLayout extends StatelessWidget {
  const AskForOldMayorLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AskForOldMayorViewModel>(
      builder: (context, model, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width),
            const Text(
              "English: You're of age?\n\nEspañol: ¿Eres mayor de edad?",
              style: TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
