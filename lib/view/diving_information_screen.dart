import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sea_sentinels/constants.dart';
import 'package:sea_sentinels/model/diving_model.dart';
import 'package:sea_sentinels/view/widget/grid_item.dart';
import 'package:sea_sentinels/view/widget/text_border.dart';

class DivingInformations extends StatelessWidget {
  const DivingInformations({super.key, required this.diving});

  final Diving diving;

  final Color color = kDarkBlue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: const Center(
                child: Text(
                  'Diving Information',
                  style: TextStyle(
                    color: kYellow,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            TextBorder(
              title: 'Position: ',
              text:
                  'Lat: ${diving.position.latitude}, Long: ${diving.position.longitude}'),
          TextBorder(title: 'School: ', text: diving.divingSchool),
          TextBorder(title: 'City: ', text: diving.city),
          TextBorder(title: 'Province: ', text: diving.province),
          TextBorder(
              title: 'Date and time: ',
              text: dateFormat.format(diving.date)),
          TextBorder(title: 'Maximum depth: ', text: '${diving.maxDepth} mt'),
          TextBorder(
              title: 'Depth of maximum permanence: ',
              text: '${diving.maxDurationDepth} mt'),
          TextBorder(title: 'Water temperature: ', text: '${diving.temperature}°C'),
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
      ),
    );
  }
}
