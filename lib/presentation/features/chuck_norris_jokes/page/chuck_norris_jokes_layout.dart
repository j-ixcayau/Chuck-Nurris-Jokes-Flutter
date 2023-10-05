import 'package:flutter/material.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'package:chuck_norris_jokes/presentation/features/chuck_norris_jokes/view_model/chuck_norris_jokes_view_model.dart';
import 'package:chuck_norris_jokes/presentation/features/chuck_norris_jokes/widgets/chuck_norris_joke_item.dart';

class ChuckNorrisJokesLayout extends StatelessWidget {
  const ChuckNorrisJokesLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChuckNorrisJokesViewModel>(
      builder: (context, model, _) {
        final bannerHeight = model.myBanner?.size.height.toDouble() ?? 100;

        return Container(
          margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ListView.builder(
                itemCount: model.jokes.length,
                padding: EdgeInsets.only(
                  bottom: bannerHeight,
                ),
                itemBuilder: (context, i) {
                  return ChuckNorrisJokeItem(
                    joke: model.jokes[i],
                    onTap: (joke) {
                      model.onJokeTap(joke, context);
                    },
                  );
                },
              ),
              if (model.myBanner != null)
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: bannerHeight,
                  child: AdWidget(
                    ad: model.myBanner!,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
