import '../models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();

  var isLoading = false.obs;

  var loginModel = Rxn<LoginModel>();

  void login() async {
    if (txtUsername.text.isEmpty || txtPassword.text.isEmpty) {
      Get.snackbar(
        'Warning',
        'Username dan Password harus terisi',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    } else {
      try {
        isLoading.value = true;
        final url = Uri.parse("https://mediadwi.com/api/latihan/login");

        final response = await http.post(url, body: {
          "username" : txtUsername.text.toString(),
          "password" : txtPassword.text.toString()
        });

        isLoading.value = false;
        if (response.statusCode == 200) {
          loginModel.value = loginModelFromJson(response.body);

          if (loginModel.value?.status == true) {
            Get.snackbar("berhasil", loginModel.value!.message.toString());
            // nanti Get.offNamed('/main_menu');
            Get.offNamed('/main_menu');
          } else {
            Get.snackbar("gagal", loginModel.value!.message.toString());
          }

        } else {
          Get.snackbar("gagal", "cek internet connection");
        }
      } catch (e) {
        Get.snackbar("gagal", e.toString());
        print("error nya "+e.toString());
      }
    }
  }
}