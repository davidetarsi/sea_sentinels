import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sea_sentinels/constants.dart';

class TextBorder extends StatelessWidget {
  final String? text;
  final String? title;

  const TextBorder(
      {super.key,
      this.text,
      this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: kBlueGrey, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(10),
        child: FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: RichText(
            text: TextSpan(
              children: [
                if (title != null)
                TextSpan(
                  text: title,
                  style: const TextStyle(color: kBlueGrey, fontSize: 16),
                ),
                if (text != null)
                TextSpan(
                  text: text,
                  style: const TextStyle(color: kYellow, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
