import 'package:get/get.dart';
import '../models/makanan_model.dart';

class ListMakananController extends GetxController {
  List<MakananModel> listMakanan = [
    MakananModel(
      namaMakanan: "Nasi Goreng Spesial",
      hargaMakanan: "25.000",
      gambarUrl:
      "https://awsimages.detik.net.id/community/media/visual/2021/08/25/resep-nasi-goreng-sosis-ala-warung-bhakti_43.jpeg?w=1200",
      deskripsi:
      "Nasi goreng bumbu rempah dengan telur mata sapi, ayam suwir, dan kerupuk.",
      rating: 4.9,
      review: [
        "Bumbu rempahnya berasa banget dan wangi smoky! Porsinya pas, ayam suwirnya melimpah, dan telur mata sapinya matang sempurna. Worth it banget sama harganya!",
        "Nasi goreng favorit tiap kali pesan di sini. Kerupuknya masih renyah pas sampai, rasanya gurih nampol!",
        "Enak banget dan mengenyangkan. Kalau bisa pedasnya ditambahin sedikit lagi bakal makin mantap!",
      ],
    ),
    MakananModel(
      namaMakanan: "Ayam Bakar Madu",
      hargaMakanan: "30.000",
      gambarUrl:
      "https://img-global.cpcdn.com/recipes/f408cf2e63a88055/1200x630cq80/photo.jpg",
      deskripsi:
      "Ayam bakar olesan madu murni lengkap dengan sambal terasi dan lalapan.",
      rating: 4.5,
      review: [
        "Olesan madunya meresap sampai ke tulang, manis gurihnya pas dan daging ayamnya empuk banget. Sambal terasinya juara!",
        "Paling suka sama ayam bakar madu ini. Lalapannya segar, sambalnya nendang, bikin nambah nasi terus!",
        "Bumbu bakarnya enak dan gak gosong. Ukurannya juga lumayan besar untuk harga Rp30.000.",
      ],
    ),
    MakananModel(
      namaMakanan: "Sate Ayam Madura",
      hargaMakanan: "28.000",
      gambarUrl:
      "https://i.ytimg.com/vi/R0mDzP0A_DQ/maxresdefault.jpg",
      deskripsi:
      "10 tusuk sate ayam daging pilihan dengan siraman bumbu kacang kental.",
      rating: 4.8,
      review: [
        "Bumbu kacangnya kental, gurih, dan teksturnya lembut. Potongan daging ayamnya tebal-tebal tanpa banyak lemak. Mantap!",
        "Satenya enak dan bumbu kacangnya melimpah. Bakal jadi langganan kalau lagi ngidam sate Madura.",
        "10 tusuk beneran puas banget makannya. Dagingnya juicy, gak kering sama sekali pas dibakar.",
      ],
    ),
    MakananModel(
      namaMakanan: "Mie Ayam Bakso",
      hargaMakanan: "20.000",
      gambarUrl:
      "https://mc.tanahbumbukab.go.id/wp-content/uploads/2025/02/WhatsApp-Image-2025-02-11-at-17.49.51-1920x1440.jpeg",
      deskripsi:
      "Mie kenyal dengan topping ayam kecap, sawi hijau, dan 2 butir bakso sapi.",
      rating: 4.8,
      review: [
        "Tekstur mienya kenyal dan gak gampang putus. Topping ayam kecapnya manis gurih, bakso sapinya juga berasa daging banget!",
        "Harga Rp20.000 tapi porsinya gak pelit. Sawi hijaunya segar, kuahnya kaldu banget, cocok dimakan pas hujan.",
        "Mie ayamnya enak, baksonya kenyal. Porsinya pas buat makan siang.",
      ],
    ),
    MakananModel(
      namaMakanan: "Es Teh Manis Jumbo",
      hargaMakanan: "8.000",
      gambarUrl:
      "https://rricoid-assets.obs.ap-southeast-4.myhuaweicloud.com/berita/Bengkulu/o/1719748451929-Screenshot_20240630-185401/jm2m69ldy6d16lx.jpeg",
      deskripsi:
      "Minuman teh melati segar dengan gula asli dan es batu kristal.",
      rating: 4.8,
      review: [
        "Beneran jumbo ukurannya! Aroma teh melatinya wangi banget dan manisnya pakai gula asli, gak bikin seret di tenggorokan!",
        "Segar pol! Es batu kristalnya banyak jadi dinginnya awet sampai tetes terakhir. Cocok banget buat nemenin makan berat.",
        "Murah meriah cuma Rp8.000 tapi gelasnya gede banget. Manisnya pas dan tehnya pekat.",
      ],
    ),
  ];
}