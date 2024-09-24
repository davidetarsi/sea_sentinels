import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sea_sentinels/constants.dart';
import 'package:sea_sentinels/model/diving_model.dart';
import 'package:sea_sentinels/model/fish_item_model.dart';
import 'package:sea_sentinels/model/fish_model.dart';
import 'package:sea_sentinels/providers/diving_provider.dart';
import 'package:sea_sentinels/view/widget/my_scaffold.dart';

class FishPage extends ConsumerWidget {
  const FishPage({super.key, required this.fish});

  final Fish fish;
  final EdgeInsets buttonPadding = const EdgeInsets.fromLTRB(0, 10, 0, 10);
  final EdgeInsets imageCardMargin = const EdgeInsets.all(20);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final divingNotifierProviderAsync = ref.watch(divingNotifierProvider);
    final divingNotifier = ref.read(divingNotifierProvider.notifier);
    final quantities = fish.quantities;

    List<FishItem> tapButton(Diving diving, Quantity quantity) {
      final List<FishItem> fishItemList = diving.fishList;
      final List<Fish> fishList =
          fishItemList.map((FishItem item) => item.fish).toList();
      List<FishItem> ausilaryFishItemList = [...fishItemList];

      if (fishList.contains(fish)) {
        ausilaryFishItemList.removeWhere((FishItem item) => item.fish == fish);
        if (quantity != Quantity.zero) {
          ausilaryFishItemList.add(FishItem(fish: fish, quantity: quantity));
          print('fish added');
        }
      } else {
        ausilaryFishItemList.add(FishItem(fish: fish, quantity: quantity));
        print('fish added');
      }
      Navigator.of(context).pop();
      return ausilaryFishItemList;

      //!!!!! CCONTROLLARE VISIBILITà E PRESENZA IN COLLECTION
    }

    /* final List<String> fishNames =
          fishList.map((Fish element) => element.getName).toList();
      if (quantity == Quantity.zero && fishNames.contains(fish.getName)) {
        fishList.removeWhere((Fish element) => element.getName == fish.getName);
      }
      if (quantity != Quantity.zero && !fishNames.contains(fish.getName)) {
        fishList.add(fish.copyWith(quantity: quantity));
        //!!!!! CCONTROLLARE VISIBILITà E PRESENZA IN COLLECTION
      }
      Navigator.of(context).pop();
    } */

    return MyScaffold(
      title: "",
      body: divingNotifierProviderAsync.when(
        data: (diving) => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) => Padding(
            padding: const EdgeInsets.fromLTRB(15,0,0,0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: constraints.maxWidth * 0.8,
                  child: Card(
                    //margin: cardMargin,
                    color: kLightDarkBlue,
                    //elevation: 5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Card(
                            margin: imageCardMargin,
                            //elevation: 5,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(fish.path,
                                    fit: BoxFit.scaleDown))),
                        const SizedBox(height: 7),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              fish.name,
                              style:
                                  const TextStyle(color: kYellow, fontSize: 16),
                            ),
                          ),
                        ),
                      ], // lib/assets/photo/boxCrab.jpg
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text('How many of them have you seen?',
                    style: TextStyle(color: kYellow, fontSize: 16)),
                const SizedBox(height: 10),
                SizedBox(
                  width: constraints.maxWidth * 0.9,
                  child: Column(
                    children: [
                      Padding(
                        padding: buttonPadding,
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                side:
                                    const BorderSide(color: kBlueGrey, width: 1),
                                backgroundColor: kDarkBlue,
                              ),
                              onPressed: () {
                                List<FishItem> fishItemList =
                                    tapButton(diving, quantities[0]);
                                divingNotifier.updateDiving(
                                    diving.copyWith(fishList: fishItemList));
                              }, //onButtonTap(),
                              child: Text(quantities[0].quantityToString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: kBlueGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),
                      Padding(
                        padding: buttonPadding,
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                side:
                                    const BorderSide(color: kBlueGrey, width: 1),
                                backgroundColor: kDarkBlue,
                              ),
                              onPressed: () {
                                List<FishItem> fishItemList =
                                    tapButton(diving, quantities[1]);
                                divingNotifier.updateDiving(
                                    diving.copyWith(fishList: fishItemList));
                              },
                              child: Text(quantities[1].quantityToString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: kBlueGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),
                      Padding(
                        padding: buttonPadding,
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                side:
                                    const BorderSide(color: kBlueGrey, width: 1),
                                backgroundColor: kDarkBlue,
                              ),
                              onPressed: () {
                                List<FishItem> fishItemList =
                                    tapButton(diving, quantities[2]);
                                divingNotifier.updateDiving(
                                    diving.copyWith(fishList: fishItemList));
                              },
                              child: Text(quantities[2].quantityToString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: kBlueGrey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        error: (err, stack) => Center(child: Text('Error: $err')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
