import 'package:flutter/widgets.dart';

Widget goalStat(int expandedTime, int homeGoal, int awayGaol) {
  return Expanded(
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        '$expandedTime',
        style: const TextStyle(fontSize: 30.0),
      ),
      Expanded(
          child: Center(
        child: Text(
          '$homeGoal - $awayGaol',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 34.0),
        ),
      ))
    ],
  ));
}
