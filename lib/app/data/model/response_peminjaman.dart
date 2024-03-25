/// message : "Peminjaman found successfully"
/// data : {"PinjamID":2,"UserID":4,"BookID":11,"TglPeminjaman":"2024-02-26","TglPengembalian":"2024-02-27","Status":"dipinjam","Buku":{"BookID":11,"Judul":"Kimetsu no Yaiba","Tahunterbit":"2016","Penulis":"Koyoharu Gotōge","Jumlahhlmn":23,"Penerbit":"Shueisha","Deskripsi":" ","Gambar":"https://upload.wikimedia.org/wikipedia/id/0/09/Demon_Slayer_-_Kimetsu_no_Yaiba%2C_volume_1.jpg"},"User":{"Namalengkap":"Amba Lele"}}

class ResponsePeminjaman {
  ResponsePeminjaman({
      this.message, 
      this.data,});

  ResponsePeminjaman.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataPeminjaman.fromJson(json['data']) : null;
  }
  String? message;
  DataPeminjaman? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// PinjamID : 2
/// UserID : 4
/// BookID : 11
/// TglPeminjaman : "2024-02-26"
/// TglPengembalian : "2024-02-27"
/// Status : "dipinjam"
/// Buku : {"BookID":11,"Judul":"Kimetsu no Yaiba","Tahunterbit":"2016","Penulis":"Koyoharu Gotōge","Jumlahhlmn":23,"Penerbit":"Shueisha","Deskripsi":" ","Gambar":"https://upload.wikimedia.org/wikipedia/id/0/09/Demon_Slayer_-_Kimetsu_no_Yaiba%2C_volume_1.jpg"}
/// User : {"Namalengkap":"Amba Lele"}

class DataPeminjaman {
  DataPeminjaman({
      this.pinjamID, 
      this.userID, 
      this.bookID, 
      this.tglPeminjaman, 
      this.tglPengembalian, 
      this.status, 
      this.buku, 
      this.user,});

  DataPeminjaman.fromJson(dynamic json) {
    pinjamID = json['PinjamID'];
    userID = json['UserID'];
    bookID = json['BookID'];
    tglPeminjaman = json['TglPeminjaman'];
    tglPengembalian = json['TglPengembalian'];
    status = json['Status'];
    buku = json['Buku'] != null ? Buku.fromJson(json['Buku']) : null;
    user = json['User'] != null ? User.fromJson(json['User']) : null;
  }
  int? pinjamID;
  int? userID;
  int? bookID;
  String? tglPeminjaman;
  String? tglPengembalian;
  String? status;
  Buku? buku;
  User? user;

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
    if (user != null) {
      map['User'] = user?.toJson();
    }
    return map;
  }

}

/// Namalengkap : "Amba Lele"

class User {
  User({
      this.namalengkap,});

  User.fromJson(dynamic json) {
    namalengkap = json['Namalengkap'];
  }
  String? namalengkap;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Namalengkap'] = namalengkap;
    return map;
  }

}

/// BookID : 11
/// Judul : "Kimetsu no Yaiba"
/// Tahunterbit : "2016"
/// Penulis : "Koyoharu Gotōge"
/// Jumlahhlmn : 23
/// Penerbit : "Shueisha"
/// Deskripsi : " "
/// Gambar : "https://upload.wikimedia.org/wikipedia/id/0/09/Demon_Slayer_-_Kimetsu_no_Yaiba%2C_volume_1.jpg"

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
  String? gambar;

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