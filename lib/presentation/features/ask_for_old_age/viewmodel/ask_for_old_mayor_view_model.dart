import 'package:flutter/widgets.dart';

class AskForOldMayorViewModel extends ChangeNotifier {
  AskForOldMayorViewModel({
    required this.context,
  });

  BuildContext context;

  void onContinueTap() {
    print('onContinueTap');
  }

  void onCancelTap() {
    print('onContinueTap');
  }
}
