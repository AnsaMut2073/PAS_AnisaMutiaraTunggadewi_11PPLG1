import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/list_makanan_controller.dart';
import 'package:pas_anisa_mutiara_tunggadewi/routes.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final controller = Get.put(ListMakananController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Makanan")),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView.builder(
            itemCount: controller.listMakanan.length,
            itemBuilder: (context, index) {
              final makanan = controller.listMakanan[index];
              return InkWell(
                onTap: () {
                  Get.toNamed(Routes.detail_makanan, arguments: makanan);
                },
                child: ListTile(
                  title: Text(makanan.namaMakanan),
                  subtitle: Text("Rp. " + makanan.hargaMakanan),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              );
            }
        ),
      ),
    );
  }
}
