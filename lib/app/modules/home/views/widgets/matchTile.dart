import 'package:flutter/material.dart';
import 'package:myplayer/app/modules/home/controllers/api_manager.dart';

Widget matchTile(SoccerMatch match) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: Text(
          match.home.name.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )),
        Image.network(
          match.home.logoUrl.toString(),
          width: 36,
        ),
        Expanded(
            child: Text(
          '${match.goal.home} - ${match.goal.away}',
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )),
        Image.network(
          match.away.logoUrl.toString(),
          width: 36,
        ),
        Expanded(
            child: Text(
          match.away.name.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )),
      ],
    ),
  );
}
