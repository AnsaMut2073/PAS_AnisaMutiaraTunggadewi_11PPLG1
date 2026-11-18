import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../menu/home.dart';
import '../menu/feat.dart';
import '../menu/profile.dart';

class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  void changePage(int index) {
    selectedIndex.value = index;
  }

  List<Widget> listPages = [
    Home(),
    Feat(),
    Profile(),
  ];
}