import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:chuck_norris_jokes/presentation/features/ask_for_old_age/page/ask_for_old_mayor_layout.dart';
import 'package:chuck_norris_jokes/presentation/features/ask_for_old_age/view_model/ask_for_old_mayor_view_model.dart';
import 'package:chuck_norris_jokes/presentation/features/ask_for_old_age/widgets/ask_for_old_mayor_config_icon.dart';

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
            title: Text(
              'oldMayorPage.appbarTitle'.tr(),
            ),
            centerTitle: true,
            actions: const [
              AskForOldMayorConfigIcon(),
            ],
          ),
          body: const AskForOldMayorLayout(),
        );
      },
    );
  }
}
