import 'package:flutter/material.dart';
import 'package:myplayer/app/modules/home/controllers/api_manager.dart';
import 'package:myplayer/app/modules/home/controllers/home_controller.dart';
import 'package:myplayer/app/modules/home/views/widgets/goal_stat.dart';
import 'package:myplayer/app/modules/home/views/widgets/matchTile.dart';
import 'package:myplayer/app/modules/home/views/widgets/team_stat.dart';
import 'package:get/get.dart';

class PageBody extends GetWidget<HomeController> {
  final List<SoccerMatch> allmatches;

  const PageBody(this.allmatches, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            child: Obx(() {
              final selectedMatch = controller.selectedMatch.value;
              if (selectedMatch != null) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    teamStat(
                      "Local Team",
                      selectedMatch.home.logoUrl,
                      selectedMatch.home.name,
                    ),
                    goalStat(
                      selectedMatch.fixture.status.elapsedTime,
                      selectedMatch.goal.home,
                      selectedMatch.goal.away,
                    ),
                    teamStat(
                      "Visitor Team",
                      selectedMatch.away.logoUrl,
                      selectedMatch.away.name,
                    ),
                  ],
                );
              } else {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      teamStat("Local Team", allmatches[0].home.logoUrl,
                          allmatches[0].home.name),
                      goalStat(allmatches[0].fixture.status.elapsedTime,
                          allmatches[0].goal.home, allmatches[0].goal.away),
                      teamStat("Visitor Team", allmatches[0].away.logoUrl,
                          allmatches[0].away.name),
                    ],
                  ),
                );
              }
            }),
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF4373D9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'MATCHES',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: allmatches.length,
                    itemBuilder: (context, index) {
                      final match = allmatches[index];
                      return InkWell(
                        onTap: () {
                          controller.selectMatch(match);
                        },
                        child: matchTile(match),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
