import 'package:flutter/material.dart';

import 'package:chuck_norris_jokes/presentation/routes/route_names.dart';

class AskForOldMayorViewModel extends ChangeNotifier {
  AskForOldMayorViewModel({
    required this.context,
  });

  BuildContext context;

  void onContinueTap() {
    Navigator.pushReplacementNamed(context, RouteNames.jokesList);
  }

  void onCancelTap() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'English:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Due to your age you cannot see the content of the app',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Español:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Debido a tu edad no puedes ver el contenido del app',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
