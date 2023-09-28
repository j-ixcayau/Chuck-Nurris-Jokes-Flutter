import 'package:flutter/widgets.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../domain/entities/joke.dart';

class DisplayRandomJokeViewModel extends ChangeNotifier {
  DisplayRandomJokeViewModel({
    required this.joke,
  }) {
    _init();
  }

  final Joke joke;
  InterstitialAd? interstitialAd;

  void _init() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-1119049943081584/4274503265',
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          interstitialAd?.show();
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('InterstitialAd failed to load: $error');
        },
      ),
    );

    interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        print('%ad onAdShowedFullScreenContent.');
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
      },
      onAdImpression: (InterstitialAd ad) {
        print('$ad impression occurred.');
      },
    );
  }

  @override
  void dispose() {
    interstitialAd?.dispose();

    super.dispose();
  }
}
