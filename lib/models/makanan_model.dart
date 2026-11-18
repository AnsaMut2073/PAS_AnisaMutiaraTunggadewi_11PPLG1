class MakananModel {
  String namaMakanan;
  String hargaMakanan;
  String gambarUrl;
  String deskripsi;
  double rating;
  List<String> review;

  MakananModel(
      {
        required this.namaMakanan,
        required this.hargaMakanan,
        required this.gambarUrl,
        required this.deskripsi,
        required this.rating,
        required this.review,
      });
}