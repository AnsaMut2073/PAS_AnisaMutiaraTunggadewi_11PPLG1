import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_anisa_mutiara_tunggadewi/controllers/list_team_controller.dart';

class Feat extends StatelessWidget {
  Feat({super.key});

  @override
  Widget build(BuildContext context) {
    final ListTeamController controller = Get.put(ListTeamController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Daftar Tim',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),

                  SizedBox(
                    height: 150,
                    child: Obx(() {
                      if (controller.isLoading.value) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (controller.teamList.isEmpty) {
                        return Center(child: Text("Data kosong"));
                      }

                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        itemCount: controller.teamList.length,
                        itemBuilder: (context, index) {
                          final item = controller.teamList[index];

                          return Container(
                            width: 140,
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 80,
                                  width: double.infinity,
                                  color: Colors.grey[100], // Background color
                                  padding: EdgeInsets.all(8), // Padding biar logo ga mepet
                                  child: Image.network(
                                    item.strBadge ?? '',
                                    fit: BoxFit.contain,
                                    errorBuilder: (_, __, ___) => Icon(Icons.broken_image),
                                  ),
                                ),
                                // Nama & Negara
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.strTeam ?? '-',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        item.strStadium ?? '-',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.indigo[700],
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),

            // Body
            Expanded(
              child: Center(
                child: Text(
                  "Ini Team Page",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
