import 'package:flutter/material.dart';
import 'package:sea_sentinels/model/fish_model.dart';
import 'package:sea_sentinels/view/widget/grid_item.dart';

class DivingFishPage extends StatelessWidget {
  const DivingFishPage({super.key, required this.fishList});

   final List<Fish> fishList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemCount: fishList.length,
        itemBuilder: (BuildContext context, int index) {
          return GridItem(item: fishList[index], isInSurvey: true);
        },
      ),
    );
  }
}
