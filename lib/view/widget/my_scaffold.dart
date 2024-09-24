import 'package:flutter/material.dart';
import 'package:sea_sentinels/constants.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold(
      {super.key,
      required this.body,
      required this.title,
      this.backButton = true,
      this.padding = true});

  final Widget body;
  final String title;
  final bool backButton;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    final Widget widgetTitle = Text(
      title,
      style: const TextStyle(
        color: kBlueGrey,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: backButton,
        backgroundColor: kDarkBlue,
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        title: backButton ? widgetTitle : Center(child: widgetTitle),
      ),
      body: SafeArea(
        minimum: padding ? const EdgeInsets.all(10) : const EdgeInsets.all(0),
        child: body,
      ),
    );
  }
}
