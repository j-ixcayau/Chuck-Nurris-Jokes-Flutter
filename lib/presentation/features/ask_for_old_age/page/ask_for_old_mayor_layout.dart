import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import 'package:chuck_norris_jokes/presentation/features/ask_for_old_age/view_model/ask_for_old_mayor_view_model.dart';

class AskForOldMayorLayout extends StatelessWidget {
  const AskForOldMayorLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AskForOldMayorViewModel>(
      builder: (context, viewModel, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width),
            Text(
              'oldMayorPage.oldMayorQuestion'.tr(),
              style: const TextStyle(
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const SizedBox(width: 4),
                Expanded(
                  child: OutlinedButton(
                    onPressed: viewModel.onContinueTap,
                    child: Text(
                      'oldMayorPage.yesOption'.tr(),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: ElevatedButton(
                    onPressed: viewModel.onCancelTap,
                    child: Text(
                      'oldMayorPage.noOption'.tr(),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
              ],
            ),
          ],
        );
      },
    );
  }
}
