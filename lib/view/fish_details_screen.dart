import 'package:flutter/material.dart';
import 'package:sea_sentinels/model/fish_item_model.dart';
import 'package:sea_sentinels/view/widget/my_scaffold.dart';
import 'package:sea_sentinels/view/widget/grid_item.dart';


class FishDetailsScreen extends StatelessWidget {
  final FishItem fishItem;

  const FishDetailsScreen({super.key, required this.fishItem});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      title: "Species details",
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: GridItem(item: fishItem, isBigSize: true)),
      ),
    );
  }
}
