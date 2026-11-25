import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_anisa_mutiara_tunggadewi/controllers/transaksi_controller.dart';

class TransaksiPage extends StatelessWidget {
  TransaksiPage({super.key});

  // Inisialisasi TransaksiController
  final TransaksiController controller = Get.put(TransaksiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pembayaran " + controller.makanan.namaMakanan)),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Gambar Makanan
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  controller.makanan.gambarUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: Center(child: Icon(Icons.broken_image, size: 50)),
                  ),
                ),
              ),
              SizedBox(height: 16),
              // 2. Nama, Rating, dan Harga Makanan
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      controller.makanan.namaMakanan,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 20),
                      SizedBox(width: 4),
                      Text(
                        controller.makanan.rating.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                "Rp ${controller.makanan.hargaMakanan}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 12),
              // 3. Deskripsi Makanan
              Text(
                controller.makanan.deskripsi,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              Divider(height: 32, thickness: 1),

              // 4. Input Jumlah Makanan yang Dibeli
              Text(
                "Jumlah Pesanan",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextField(
                controller: controller.jumlahController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Masukkan jumlah makanan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.shopping_cart_outlined),
                ),
              ),
              SizedBox(height: 24),
              // 5. Tombol Bayar
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Jalankan fungsi hitung di controller dulu
                    controller.hitungPembayaran();

                    // Pastikan jumlah valid sebelum memunculkan dialog konfirmasi
                    int jumlah = int.tryParse(controller.jumlahController.text) ?? 0;
                    if (jumlah > 0) {
                      _tampilkanDialogKonfirmasi();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Bayar",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi memunculkan Dialog Konfirmasi Rincian Pembayaran
  void _tampilkanDialogKonfirmasi() {
    Get.defaultDialog(
      title: "Rincian Pembayaran",
      titleStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Menu: ${controller.makanan.namaMakanan}"),
          Text("Jumlah: ${controller.jumlahController.text} porsi"),
          Divider(height: 20),
          // Bungkus pakai Obx agar nilai rincian selalu update secara reaktif
          Obx(() => Column(
            children: [
              _barisRincian("Subtotal", "Rp ${controller.subtotal.value.toStringAsFixed(0)}"),
              SizedBox(height: 6),
              _barisRincian("PPN (5%)", "Rp ${controller.ppn.value.toStringAsFixed(0)}"),
              Divider(height: 16),
              _barisRincian(
                "Total Bayar",
                "Rp ${controller.totalBayar.value.toStringAsFixed(0)}",
                isTotal: true,
              ),
            ],
          )),
        ],
      ),
      textConfirm: "Selesai",
      textCancel: "Batal",
      onConfirm: () {
        Get.back(); // Tutup dialog
        Get.back(); // Kembali ke halaman list makanan
        Get.snackbar(
          "Transaksi Berhasil",
          "Terima kasih sudah memesan ${controller.makanan.namaMakanan}!",
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  // Widget helper kecil supaya teks kiri-kanan di dialog rapi
  Widget _barisRincian(String label, String nilai, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            fontSize: isTotal ? 16 : 14,
          ),
        ),
        Text(
          nilai,
          style: TextStyle(
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            fontSize: isTotal ? 16 : 14,
            color: isTotal ? Colors.green : Colors.black87,
          ),
        ),
      ],
    );
  }
}
