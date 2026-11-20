import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/team_model.dart';

class ListTeamController extends GetxController {
  var isLoading = false.obs;

  var teamList = <Team>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTeams();
  }

  void fetchTeams() async {
    try {
      isLoading.value = true;
      final url = Uri.parse("https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php?l=English%20Premier%20League");
      final response = await http.get(url);
      isLoading.value = false;

      if (response.statusCode == 200) {
        final parsedData = premierLeagueModelFromJson(response.body);
        teamList.value = parsedData.teams;
      } else {
        Get.snackbar("Gagal", "Gagal mengambil data tim");
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar("Error", e.toString());
      print("error nya " + e.toString());
    }
  }
}