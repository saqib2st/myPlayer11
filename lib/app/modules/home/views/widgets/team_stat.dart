import 'package:flutter/widgets.dart';

Widget teamStat(String team, String logoUrl, String teamName) {
  return Expanded(
      child: Column(
    children: [
      Text(
        team,
        style: const TextStyle(fontSize: 20.0),
      ),
      const SizedBox(
        height: 8.0,
      ),
      Expanded(
        child: Image.network(
          logoUrl,
          width: 54.0,
        ),
      ),
      const SizedBox(
        height: 8.0,
      ),
      Text(
        teamName,
        style: const TextStyle(fontSize: 20.0),
        textAlign: TextAlign.center,
      ),
    ],
  ));
}
