import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:chuck_norris_jokes/presentation/features/ask_for_old_age/view_model/ask_for_old_mayor_view_model.dart';
import 'package:chuck_norris_jokes/presentation/utils/constants/app_locale.dart';

class AskForOldMayorConfigIcon extends StatelessWidget {
  const AskForOldMayorConfigIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.settings),
      onSelected: (locale) =>
          context.read<AskForOldMayorViewModel>().updateLocale(locale),
      itemBuilder: (BuildContext context) {
        return AppLocale.locales
            .map(
              (it) => PopupMenuItem(
                value: it,
                child: Text(it.toString().toUpperCase()),
              ),
            )
            .toList();
      },
    );
  }
}
