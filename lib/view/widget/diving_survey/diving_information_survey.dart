import 'package:flutter/material.dart';
import 'package:sea_sentinels/constants.dart';
import 'package:sea_sentinels/model/diving_model.dart';
import 'package:sea_sentinels/view/widget/grid_item.dart';
import 'package:sea_sentinels/view/widget/text_border.dart';

class DivingInformationSurvey extends StatelessWidget {
  const DivingInformationSurvey({super.key, required this.diving});

  final Diving diving;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextBorder(
              title: 'Position: ',
              text:
                  'Lat: ${diving.position.latitude}, Long: ${diving.position.longitude}'),
          TextBorder(title: 'School: ', text: diving.divingSchool),
          TextBorder(title: 'City: ', text: diving.city),
          TextBorder(title: 'Province: ', text: diving.province),
          TextBorder(
              title: 'Date: ',
              text: diving.date.toIso8601String().substring(0, 10)),
          TextBorder(title: 'Depth: ', text: '${diving.maxDepth} mt'),
          TextBorder(title: 'Temperature: ', text: '${diving.temperature}°C'),
          TextBorder(
              title: 'Duration: ',
              text: ' ${diving.duration.toString().substring(0, 4)} h'),
          
          
          const Center(
            child: Text(
              'Fish seen:',
              style: TextStyle(
                color: kYellow,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: diving.fishList.length,
              itemBuilder: (BuildContext context, int index) {
                return GridItem(item: diving.fishList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
