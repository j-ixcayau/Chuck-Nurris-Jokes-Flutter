import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:chuck_norris_jokes/presentation/utils/bad_words_checker.dart';

import '../../../../domain/entities/joke.dart';
import '../../../../domain/repositories/random_joke_repository.dart';
import '../../../routes/route_names.dart';

class ChuckNorrisJokesViewModel extends ChangeNotifier {
  ChuckNorrisJokesViewModel({
    required RandomJokeRepository repository,
  }) : _repository = repository {
    _init();
  }

  final RandomJokeRepository _repository;
  List<Joke> jokes = [];

  BannerAd? myBanner;

  void _init() async {
    _configAdd();

    _fetchNewJoke();
  }

  void _configAdd() async {
    try {
      final BannerAdListener listener = BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (Ad ad) {
          print('Ad loaded.');
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Dispose the ad here to free resources.
          ad.dispose();
          print('Ad failed to load: $error');
        },
        // Called when an ad opens an overlay that covers the screen.
        onAdOpened: (Ad ad) {
          print('Ad opened.');
        },
        // Called when an ad removes an overlay that covers the screen.
        onAdClosed: (Ad ad) {
          print('Ad closed.');
        },
        // Called when an impression occurs on the ad.
        onAdImpression: (Ad ad) {
          print('Ad impression.');
        },
      );

      myBanner = BannerAd(
        adUnitId: 'ca-app-pub-1119049943081584/5774916067',
        size: AdSize.banner,
        request: const AdRequest(),
        listener: listener,
      );

      await myBanner?.load();
    } catch (e) {
      print(e);
    }
  }

  void _fetchNewJoke() {
    if (jokes.length <= 14) {
      _requestNewJoke();
    }
  }

  void _requestNewJoke() async {
    final result = await _repository.getRandomJoke();

    result.fold(
      (l) {},
      (r) {
        _addJokeToList(r);
      },
    );

    _fetchNewJoke();
  }

  void _addJokeToList(Joke joke) {
    final jokeIndex = jokes.indexWhere((it) => it.id == joke.id);

    if (jokeIndex != -1) {
      return;
    }

    final newJoke = Joke(
      iconUrl: joke.iconUrl,
      id: joke.id,
      value: BadWorkdsChecker.clean(joke.value),
      url: joke.url,
    );

    jokes.add(newJoke);

    notifyListeners();
  }

  void onJokeTap(Joke joke, BuildContext context) {
    Navigator.pushNamed(context, RouteNames.singleJoke, arguments: joke);
  }
}
