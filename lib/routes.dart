import 'package:get/get.dart';
import 'package:pas_anisa_mutiara_tunggadewi/pages/login_page.dart';
import 'package:pas_anisa_mutiara_tunggadewi/pages/detail_makanan_page.dart';
import 'package:pas_anisa_mutiara_tunggadewi/pages/main_menu_page.dart';
import 'package:pas_anisa_mutiara_tunggadewi/pages/transaksi_page.dart';

import 'menu/home.dart';
import 'menu/feat.dart';
import 'menu/profile.dart';

class Routes {
  static const String login = "/login";
  static const String main_menu = "/main_menu";
  static const String home = "/home";
  static const String feat = "/feat";
  static const String profile = "/profile";
  static const String detail_makanan = "/detail_makanan";
  static const String transaksi = "/transaksi";

  static final myPages = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: main_menu, page: () => MainMenuPage()),
    GetPage(name: home, page: () => Home()),
    GetPage(name: feat, page: () => Feat()),
    GetPage(name: profile, page: () => Profile()),
    GetPage(name: detail_makanan, page: () => DetailMakananPage()),
    GetPage(name: transaksi, page: () => TransaksiPage()),
  ];
}