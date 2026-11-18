import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login API')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: controller.txtUsername,
                decoration: InputDecoration(labelText: 'Input Username'),
              ),
              SizedBox(height: 12),
              TextField(
                controller: controller.txtPassword,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Input Password'),
              ),
              SizedBox(height: 24),

              // Widget Reaktif Menggunakan Obx
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                return ElevatedButton(
                  onPressed: () => controller.login(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black45,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Login'),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

