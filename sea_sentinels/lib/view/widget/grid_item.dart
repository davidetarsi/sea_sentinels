import 'package:flutter/material.dart';
import 'package:sea_sentinels/model/fish_item_model.dart';
import 'package:sea_sentinels/view/fish_details_screen.dart';
import 'package:sea_sentinels/constants.dart';
import 'package:sea_sentinels/model/fish_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sea_sentinels/view/widget/diving_survey/fish_page_survey.dart';

class GridItem extends StatelessWidget {
  final Object? item;
  final bool isBigSize;
  final bool isInSurvey;
  final cardMargin = const EdgeInsets.fromLTRB(3, 10, 3, 3);
  final EdgeInsets imageCardMargin = const EdgeInsets.fromLTRB(3, 15, 3, 3);
  final EdgeInsets bigCardMargin = const EdgeInsets.all(10);
  final EdgeInsets bigImageCardMargin =
      const EdgeInsets.fromLTRB(30, 30, 30, 10);

  final double sizeMoltiplicator = 0.85;

  const GridItem(
      {super.key, this.item, this.isBigSize = false, this.isInSurvey = false});

  void onTap(context, FishItem fishItem) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => FishDetailsScreen(fishItem: fishItem),
      ),
    );
  }

  void onSurvey(context, Fish fish) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => FishPage(fish: fish),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    late Fish newFish;
    late FishItem newFishItem;
    late Widget page;

    late Widget inSurvey = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          GestureDetector(
        onTap: () => isBigSize ? null : onSurvey(context, newFish),
        child: SizedBox(
          width: isBigSize ? constraints.maxWidth * sizeMoltiplicator : null,
          height:
              isBigSize ? constraints.maxHeight * sizeMoltiplicator / 2 : null,
          child: Card(
            margin: isBigSize ? bigCardMargin : cardMargin,
            color: kDarkBlue,
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Card(
                    margin: isBigSize ? bigImageCardMargin : imageCardMargin,
                    elevation: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(newFish.path, fit: BoxFit.fill),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      newFish.name,
                      style: const TextStyle(color: kYellow, fontSize: 16),
                    ),
                  ),
                ),
                if (isBigSize)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: TextButton(
                            onPressed: () => launchUrl(newFish.wikiUri),
                            child: const Text(
                              'See more information',
                              style: TextStyle(color: kBlueGrey, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
              ], // lib/assets/photo/boxCrab.jpg
            ),
          ),
        ),
      ),
    );

    late Widget inCollection = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          GestureDetector(
        onTap: () => isBigSize ? null : onTap(context, newFishItem),
        child: SizedBox(
          width: isBigSize ? constraints.maxWidth * sizeMoltiplicator : null,
          height:
              isBigSize ? constraints.maxHeight * sizeMoltiplicator / 2 : null,
          child: Card(
            margin: isBigSize ? bigCardMargin : cardMargin,
            color: kDarkBlue,
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Card(
                      margin: isBigSize ? bigImageCardMargin : imageCardMargin,
                      elevation: 5,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: newFishItem.isPresent
                              ? Image.asset(newFishItem.fish.path,
                                  fit: BoxFit.fill)
                              : Container(
                                  width: (isBigSize)
                                      ? constraints.maxWidth * sizeMoltiplicator
                                      : null,
                                  /* height: (isBigSize)
                                      ? constraints.maxHeight * sizeMoltiplicator/2
                                      : null, */
                                  color: kLightDarkBlue,
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        /* mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min, */
                                        children: [
                                          //SizedBox(height: 10),
                                          Expanded(
                                            child: Icon(Icons.question_mark,
                                                color: kBlueGrey, size: 15),
                                          ),
                                          SizedBox(height: 5),
                                          Expanded(
                                            child: Text(
                                              'Not available',
                                              style: TextStyle(
                                                  color: kBlueGrey,
                                                  fontSize: 10,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                          //SizedBox(height: 10),
                                        ]),
                                  ))

                          /* Image.asset('lib/assets/no-image-icon.png',
                                fit: BoxFit.fill), */
                          )),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      newFishItem.fish.name,
                      style: const TextStyle(color: kYellow, fontSize: 16),
                    ),
                  ),
                ),
                if (isBigSize)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: TextButton(
                            onPressed: () =>
                                launchUrl(newFishItem.fish.wikiUri),
                            child: const Text(
                              'See more information',
                              style: TextStyle(color: kBlueGrey, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
              ], // lib/assets/photo/boxCrab.jpg
            ),
          ),
        ),
      ),
    );

    if (item != null && item is Fish) {
      newFish = item! as Fish;
      page = inSurvey;
    }
    if (item != null && item is FishItem) {
      newFishItem = item! as FishItem;
      newFish = newFishItem.fish;
      page = inCollection;
    }

    return page;

    /* LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          GestureDetector(
        onTap: () => isBigSize
            ? null
            : isInSurvey
                ? onSurvey(context, newFish)
                : onTap(context, newFishItem),
        child: SizedBox(
          width: isBigSize ? constraints.maxWidth * sizeMoltiplicator : null,
          height:
              isBigSize ? constraints.maxHeight * sizeMoltiplicator / 2 : null,
          child: Card(
            margin: isBigSize ? bigCardMargin : cardMargin,
            color: kDarkBlue,
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Card(
                      margin: isBigSize ? bigImageCardMargin : imageCardMargin,
                      elevation: 5,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: newFishItem.isPresent || isInSurvey
                              ? Image.asset(newFish.path, fit: BoxFit.fill)
                              : Container(
                                  width: (isBigSize)
                                      ? constraints.maxWidth * sizeMoltiplicator
                                      : null,
                                  /* height: (isBigSize)
                                      ? constraints.maxHeight * sizeMoltiplicator/2
                                      : null, */
                                  color: kLightDarkBlue,
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        /* mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min, */
                                        children: [
                                          //SizedBox(height: 10),
                                          Expanded(
                                            child: Icon(Icons.question_mark,
                                                color: kBlueGrey, size: 15),
                                          ),
                                          SizedBox(height: 5),
                                          Expanded(
                                            child: Text(
                                              'Not available',
                                              style: TextStyle(
                                                  color: kBlueGrey,
                                                  fontSize: 10,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          ),
                                          //SizedBox(height: 10),
                                        ]),
                                  ))

                          /* Image.asset('lib/assets/no-image-icon.png',
                                fit: BoxFit.fill), */
                          )),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      newFish.getName,
                      style: const TextStyle(color: kYellow, fontSize: 16),
                    ),
                  ),
                ),
                if (isBigSize)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: TextButton(
                            onPressed: () => launchUrl(newFish.wikiUri),
                            child: const Text(
                              'See more information',
                              style: TextStyle(color: kBlueGrey, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
              ], // lib/assets/photo/boxCrab.jpg
            ),
          ),
        ),
      ),
    );
  } */
  }
}
