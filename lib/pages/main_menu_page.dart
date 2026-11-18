import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_anisa_mutiara_tunggadewi/controllers/main_menu_controller.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final mainMenuController = Get.put(MainMenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(title: Text("My App")),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              child: Text('Menu Navigasi', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('Home'),
              selected: mainMenuController.selectedIndex.value == 0,
              onTap: () {
                mainMenuController.changePage(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.sports_football_outlined),
              title: Text('Feat'),
              selected: mainMenuController.selectedIndex.value == 1,
              onTap: () {
                mainMenuController.changePage(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person_2_outlined),
              title: Text('Profile'),
              selected: mainMenuController.selectedIndex.value == 2,
              onTap: () {
                mainMenuController.changePage(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: mainMenuController.selectedIndex.value,
        children: mainMenuController.listPages,
      ),
    ));
  }
}
