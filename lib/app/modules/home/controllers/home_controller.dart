import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myplayer/app/modules/home/controllers/api_manager.dart';

class HomeController extends GetxController {
  final SoccerApi soccerApi = SoccerApi();
  final selectedMatch = Rx<SoccerMatch?>(null);

  void selectMatch(SoccerMatch match) {
    selectedMatch.value = match;
  }

  @override
  void onInit() {
    super.onInit();
    getAllMatches();
  }

  Future<void> getAllMatches() async {
    try {
      List<SoccerMatch> matches = await soccerApi.getAllMatches();
      if (matches.isNotEmpty) {
        selectedMatch.value = matches[0];
      }
    } catch (e) {
      print('Error while fetching matches: $e');
    }
  }
}

class SoccerApi {
  final String apiUrl =
      "https://v3.football.api-sports.io/fixtures?season=2020&league=39";

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "8bf165ccfc03ecea8eb9fecc5ea6460c"
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    http.Response res = await http.get(Uri.parse(apiUrl), headers: headers);
    var body;

    if (res.statusCode == 200) {
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: $body");
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      return matches;
    } else {
      throw 'Error: ${res.statusCode}';
    }
  }
}
