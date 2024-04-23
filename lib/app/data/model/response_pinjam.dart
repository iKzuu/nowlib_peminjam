class ResponsePinjam {
  ResponsePinjam({
      this.message, 
      this.total, 
      this.data,});

  ResponsePinjam.fromJson(dynamic json) {
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataPinjam.fromJson(v));
      });
    }
  }
  String? message;
  int? total;
  List<DataPinjam>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['total'] = total;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class DataPinjam {
  DataPinjam({
      this.pinjamID, 
      this.userID, 
      this.bookID, 
      this.tglPeminjaman, 
      this.tglPengembalian, 
      this.status, 
      this.buku, 
      this.user,});

  DataPinjam.fromJson(dynamic json) {
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

class User {
  User({
      this.namalengkap, 
      this.alamat, 
      this.email, 
      this.username, 
      this.role,});

  User.fromJson(dynamic json) {
    namalengkap = json['Namalengkap'];
    alamat = json['Alamat'];
    email = json['Email'];
    username = json['Username'];
    role = json['Role'];
  }
  String? namalengkap;
  String? alamat;
  String? email;
  String? username;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Namalengkap'] = namalengkap;
    map['Alamat'] = alamat;
    map['Email'] = email;
    map['Username'] = username;
    map['Role'] = role;
    return map;
  }

}

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