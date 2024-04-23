class Endpoint {
  // static const String baseUrlApi = "http://127.0.0.1:8000/api/v1/petugas/";
  // static const String baseUrlApi = "https://api-nowlib.vercel.app/api/";
  static const String baseUrlApi = "http://192.168.1.2:3000/api/";
  static const String register = "${baseUrlApi}user/register";
  static const String login = "${baseUrlApi}user/login";
  static const String user = "${baseUrlApi}user";

  //untuk menampilkan daftar pinjam
  static const String pinjam = "${baseUrlApi}peminjaman/riwayat";

  //untuk melakukan peminjaman buku
  static const String peminjaman = "${baseUrlApi}peminjaman";
  static const String pinjem = "${baseUrlApi}peminjaman";

  //relasi dan buku
  static const String relasi = "${baseUrlApi}kategori/relasi";
  static const String buku = "${baseUrlApi}buku";

  //koleksi dan buku
  static const String addkol = "${baseUrlApi}koleksi";
  static const String getkol = "${baseUrlApi}koleksi/daftarkol";
  static const String deletekol = "${baseUrlApi}koleksi";

  //ulasan buku
  static const String ulasan = "${baseUrlApi}ulasan";

  //tambah buku
  static const String addbook = "${baseUrlApi}buku";
}