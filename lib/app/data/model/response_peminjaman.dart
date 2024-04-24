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

class DataPeminjaman {
  DataPeminjaman({
      this.pinjamID, 
      this.invoiceID, 
      this.userID, 
      this.bookID, 
      this.tglPeminjaman, 
      this.tglPengembalian, 
      this.status, 
      this.buku, 
      this.user,});

  DataPeminjaman.fromJson(dynamic json) {
    pinjamID = json['PinjamID'];
    invoiceID = json['InvoiceID'];
    userID = json['UserID'];
    bookID = json['BookID'];
    tglPeminjaman = json['TglPeminjaman'];
    tglPengembalian = json['TglPengembalian'];
    status = json['Status'];
    buku = json['Buku'] != null ? Buku.fromJson(json['Buku']) : null;
    user = json['User'] != null ? User.fromJson(json['User']) : null;
  }
  int? pinjamID;
  String? invoiceID;
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
    map['InvoiceID'] = invoiceID;
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
      this.username, 
      this.alamat, 
      this.email, 
      this.role,});

  User.fromJson(dynamic json) {
    namalengkap = json['Namalengkap'];
    username = json['Username'];
    alamat = json['Alamat'];
    email = json['Email'];
    role = json['Role'];
  }
  String? namalengkap;
  String? username;
  String? alamat;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Namalengkap'] = namalengkap;
    map['Username'] = username;
    map['Alamat'] = alamat;
    map['Email'] = email;
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