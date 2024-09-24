import 'package:flutter/material.dart';
import 'package:sea_sentinels/constants.dart';
import 'package:sea_sentinels/model/fish_model.dart';

class FishItem extends StatelessWidget {
  final Fish fish;
  final TextEditingController controller;

  const FishItem({super.key, required this.fish, required this.controller});

  @override
  Widget build(BuildContext context) {
    //EdgeInsets cardMargin = const EdgeInsets.all(10);
    EdgeInsets imageCardMargin = const EdgeInsets.all(20);

    return Column(
      children: [
        Card(
          //margin: cardMargin,
          color: kLightDarkBlue,
          //elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Card(
                    margin: imageCardMargin,
                    //elevation: 5,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(fish.path, fit: BoxFit.scaleDown))),
              ),
              const SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    fish.name,
                    style: const TextStyle(color: kYellow, fontSize: 16),
                  ),
                ),
              ),
            ], // lib/assets/photo/boxCrab.jpg
          ),
        ),
        const SizedBox(height: 10),
        const Text('How many of them have you seen?',
            style: TextStyle(color: kYellow, fontSize: 16)),
        //SurveyNumberField(label: 'Quantity', controller: controller)
      ],
    );
  }
}
