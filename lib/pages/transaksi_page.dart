import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/makanan_model.dart';

class TransaksiPage extends StatelessWidget {
  TransaksiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MakananModel makanan = Get.arguments as MakananModel;

    return Scaffold(
      appBar: AppBar(title: Text("Pembayaran " + makanan.namaMakanan)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          ],
        ),
      ),
    );
  }
}
