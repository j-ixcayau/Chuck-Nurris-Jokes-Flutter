import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

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
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'oldMayorPage.alertOfNotAllowed.desc'.tr(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'oldMayorPage.alertOfNotAllowed.okOption'.tr(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void updateLocale(Locale locale) async {
    if (context.locale == locale) return;

    context.setLocale(locale);
    Navigator.pushReplacementNamed(context, RouteNames.askForOldMayor);
  }
}
