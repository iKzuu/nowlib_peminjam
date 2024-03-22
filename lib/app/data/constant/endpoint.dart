class Endpoint {
  // static const String baseUrlApi = "http://127.0.0.1:8000/api/v1/petugas/";
  static const String baseUrlApi = "http://192.168.4.216:3000/api/";
  static const String register = "${baseUrlApi}user/register";
  static const String login = "${baseUrlApi}user/login";

  //untuk menampilkan daftar pinjam
  static const String pinjam = "${baseUrlApi}peminjaman/riwayat";

  //untuk melakukan peminjaman buku
  static const String peminjaman = "${baseUrlApi}peminjaman";

  //relasi dan buku
  static const String relasi = "${baseUrlApi}kategori/relasi";
  static const String buku = "${baseUrlApi}buku";

  //koleksi dan buku
  static const String addkol = "${baseUrlApi}koleksi";
  static const String getkol = "${baseUrlApi}koleksi/daftarkol";
}