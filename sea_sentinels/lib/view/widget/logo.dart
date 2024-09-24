import 'package:flutter/material.dart';
import 'package:sea_sentinels/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Uri uri =Uri(
          scheme: 'https',
          path: 'dueproject.org/en/',
        );
        launchUrl(uri);
      },
      child: Container(
        width: size,
        height: size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kDarkBlue,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(2, 1, 1, 3),
          child: Image.asset('lib/assets/logo.png'),
        ),
      ),
    );
  }
}
