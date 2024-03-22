/// message : "Koleksi found successfully"
/// data : [{"UserID":7,"BookID":25,"Buku":{"Judul":"Bahasa Indonesia XI","Penulis":"Suherli","Penerbit":"Kmendikbud","Gambar":"https://static.buku.kemdikbud.go.id/content/thumbnail/Cover_Kelas_XI_B_Indonesia_BS.png"},"User":{"Username":"Ega","Email":"eganw@email.com"}}]

class ResponseKoleksi {
  ResponseKoleksi({
      this.message, 
      this.data,});

  ResponseKoleksi.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataKoleksi.fromJson(v));
      });
    }
  }
  String? message;
  List<DataKoleksi>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// UserID : 7
/// BookID : 25
/// Buku : {"Judul":"Bahasa Indonesia XI","Penulis":"Suherli","Penerbit":"Kmendikbud","Gambar":"https://static.buku.kemdikbud.go.id/content/thumbnail/Cover_Kelas_XI_B_Indonesia_BS.png"}
/// User : {"Username":"Ega","Email":"eganw@email.com"}

class DataKoleksi {
  DataKoleksi({
      this.userID, 
      this.bookID, 
      this.buku, 
      this.user,});

  DataKoleksi.fromJson(dynamic json) {
    userID = json['UserID'];
    bookID = json['BookID'];
    buku = json['Buku'] != null ? Buku.fromJson(json['Buku']) : null;
    user = json['User'] != null ? User.fromJson(json['User']) : null;
  }
  int? userID;
  int? bookID;
  Buku? buku;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserID'] = userID;
    map['BookID'] = bookID;
    if (buku != null) {
      map['Buku'] = buku?.toJson();
    }
    if (user != null) {
      map['User'] = user?.toJson();
    }
    return map;
  }

}

/// Username : "Ega"
/// Email : "eganw@email.com"

class User {
  User({
      this.username, 
      this.email,});

  User.fromJson(dynamic json) {
    username = json['Username'];
    email = json['Email'];
  }
  String? username;
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Username'] = username;
    map['Email'] = email;
    return map;
  }

}

/// Judul : "Bahasa Indonesia XI"
/// Penulis : "Suherli"
/// Penerbit : "Kmendikbud"
/// Gambar : "https://static.buku.kemdikbud.go.id/content/thumbnail/Cover_Kelas_XI_B_Indonesia_BS.png"

class Buku {
  Buku({
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.gambar,});

  Buku.fromJson(dynamic json) {
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    gambar = json['Gambar'];
  }
  String? judul;
  String? penulis;
  String? penerbit;
  String? gambar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Judul'] = judul;
    map['Penulis'] = penulis;
    map['Penerbit'] = penerbit;
    map['Gambar'] = gambar;
    return map;
  }

}