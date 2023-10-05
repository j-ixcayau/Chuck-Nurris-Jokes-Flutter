import 'package:flutter/widgets.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:chuck_norris_jokes/data/constants.dart';
import 'package:chuck_norris_jokes/domain/entities/joke.dart';

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
      adUnitId: AppUrls.intersticialId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
          interstitialAd?.show();
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );

    interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) {
        debugPrint('%ad onAdShowedFullScreenContent.');
      },
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        debugPrint('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
      },
      onAdImpression: (InterstitialAd ad) {
        debugPrint('$ad impression occurred.');
      },
    );
  }

  @override
  void dispose() {
    interstitialAd?.dispose();

    super.dispose();
  }
}
