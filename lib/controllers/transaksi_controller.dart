import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/makanan_model.dart';

class TransaksiController extends GetxController {
  // Variabel buat nampung data makanan yang dikirim dari halaman list
  late MakananModel makanan;

  // Controller buat inputan TextField jumlah makanan
  TextEditingController jumlahController = TextEditingController(text: "1");

  // Variabel reaktif (.obs) buat nampung hasil hitungan yang bakal ditampilin ke layar
  var subtotal = 0.0.obs;
  var ppn = 0.0.obs;
  var totalBayar = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    // Nangkep data MakananModel yang dikirim lewat Get.to(() => TransaksiPage(), arguments: makanan)
    makanan = Get.arguments as MakananModel;
  }

  // Fungsi yang dipanggil pas tombol "Bayar" ditekan
  void hitungPembayaran() {
    // 1. Ambil harga dari model, hapus tanda titik (misal "25.000" jadi "25000"), lalu ubah ke double
    String hargaBersih = makanan.hargaMakanan.replaceAll('.', '');
    double harga = double.tryParse(hargaBersih) ?? 0;

    // 2. Ambil jumlah dari TextField (kalau kosong/nggak valid dianggap 0)
    int jumlah = int.tryParse(jumlahController.text) ?? 0;

    // Validasi biar nggak ngitung kalau jumlahnya 0 atau minus
    if (jumlah <= 0) {
      Get.snackbar("Oops!", "Jumlah makanan minimal 1 ya");
      return;
    }

    // 3. Hitung sesuai rumus di soal:
    // Subtotal = Harga Makanan x Jumlah Makanan
    subtotal.value = harga * jumlah;

    // PPN (5%) = Subtotal x 0.05
    ppn.value = subtotal.value * 0.05;

    // Total Bayar = Subtotal + PPN (5%)
    totalBayar.value = subtotal.value + ppn.value;
  }

  @override
  void onClose() {
    // Bersihin TextEditingController dari memori pas halaman ditutup
    jumlahController.dispose();
    super.onClose();
  }
}