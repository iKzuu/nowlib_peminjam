/// message : "Peminjaman found successfully"
/// data : [{"PinjamID":6,"UserID":7,"BookID":19,"TglPeminjaman":"2024-03-01T00:00:00.000Z","TglPengembalian":"2024-03-06T00:00:00.000Z","Status":"dipinjam","Buku":{"BookID":19,"Judul":"Kokoro","Tahunterbit":"2024","Penulis":"Anang San","Jumlahhlmn":250,"Penerbit":"KZU Corp.","Deskripsi":" ","Gambar":null}},{"PinjamID":7,"UserID":7,"BookID":11,"TglPeminjaman":"2024-03-10T00:00:00.000Z","TglPengembalian":"2024-03-15T00:00:00.000Z","Status":"dipinjam","Buku":{"BookID":11,"Judul":"Kimetsu no Yaiba","Tahunterbit":"2016","Penulis":"Koyoharu Gotōge","Jumlahhlmn":23,"Penerbit":"Shueisha","Deskripsi":" ","Gambar":"https://upload.wikimedia.org/wikipedia/id/0/09/Demon_Slayer_-_Kimetsu_no_Yaiba%2C_volume_1.jpg"}},{"PinjamID":8,"UserID":7,"BookID":1,"TglPeminjaman":"2024-03-10T00:00:00.000Z","TglPengembalian":"2024-03-20T00:00:00.000Z","Status":"dipinjam","Buku":{"BookID":1,"Judul":"Pengembara Hitam","Tahunterbit":"2000","Penulis":"Mas Fuad","Jumlahhlmn":120,"Penerbit":"Ngawi SMP","Deskripsi":" ","Gambar":null}}]

class ResponsePinjam {
  ResponsePinjam({
      this.message, 
      this.data,});

  ResponsePinjam.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataPinjam.fromJson(v));
      });
    }
  }
  String? message;
  List<DataPinjam>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// PinjamID : 6
/// UserID : 7
/// BookID : 19
/// TglPeminjaman : "2024-03-01T00:00:00.000Z"
/// TglPengembalian : "2024-03-06T00:00:00.000Z"
/// Status : "dipinjam"
/// Buku : {"BookID":19,"Judul":"Kokoro","Tahunterbit":"2024","Penulis":"Anang San","Jumlahhlmn":250,"Penerbit":"KZU Corp.","Deskripsi":" ","Gambar":null}

class DataPinjam {
  DataPinjam({
      this.pinjamID, 
      this.userID, 
      this.bookID, 
      this.tglPeminjaman, 
      this.tglPengembalian, 
      this.status, 
      this.buku,});

  DataPinjam.fromJson(dynamic json) {
    pinjamID = json['PinjamID'];
    userID = json['UserID'];
    bookID = json['BookID'];
    tglPeminjaman = json['TglPeminjaman'];
    tglPengembalian = json['TglPengembalian'];
    status = json['Status'];
    buku = json['Buku'] != null ? Buku.fromJson(json['Buku']) : null;
  }
  int? pinjamID;
  int? userID;
  int? bookID;
  String? tglPeminjaman;
  String? tglPengembalian;
  String? status;
  Buku? buku;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['PinjamID'] = pinjamID;
    map['UserID'] = userID;
    map['BookID'] = bookID;
    map['TglPeminjaman'] = tglPeminjaman;
    map['TglPengembalian'] = tglPengembalian;
    map['Status'] = status;
    if (buku != null) {
      map['Buku'] = buku?.toJson();
    }
    return map;
  }

}

/// BookID : 19
/// Judul : "Kokoro"
/// Tahunterbit : "2024"
/// Penulis : "Anang San"
/// Jumlahhlmn : 250
/// Penerbit : "KZU Corp."
/// Deskripsi : " "
/// Gambar : null

class Buku {
  Buku({
      this.bookID, 
      this.judul, 
      this.tahunterbit, 
      this.penulis, 
      this.jumlahhlmn, 
      this.penerbit, 
      this.deskripsi, 
      this.gambar,});

  Buku.fromJson(dynamic json) {
    bookID = json['BookID'];
    judul = json['Judul'];
    tahunterbit = json['Tahunterbit'];
    penulis = json['Penulis'];
    jumlahhlmn = json['Jumlahhlmn'];
    penerbit = json['Penerbit'];
    deskripsi = json['Deskripsi'];
    gambar = json['Gambar'];
  }
  int? bookID;
  String? judul;
  String? tahunterbit;
  String? penulis;
  int? jumlahhlmn;
  String? penerbit;
  String? deskripsi;
  dynamic gambar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BookID'] = bookID;
    map['Judul'] = judul;
    map['Tahunterbit'] = tahunterbit;
    map['Penulis'] = penulis;
    map['Jumlahhlmn'] = jumlahhlmn;
    map['Penerbit'] = penerbit;
    map['Deskripsi'] = deskripsi;
    map['Gambar'] = gambar;
    return map;
  }

}