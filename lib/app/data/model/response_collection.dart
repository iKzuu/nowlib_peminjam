class ResponseCollection {
  ResponseCollection({
      this.message, 
      this.data,});

  ResponseCollection.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataCollection.fromJson(v));
      });
    }
  }
  String? message;
  List<DataCollection>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class DataCollection {
  DataCollection({
      this.userID, 
      this.bookID, 
      this.koleksiID, 
      this.buku, 
      this.user,});

  DataCollection.fromJson(dynamic json) {
    userID = json['UserID'];
    bookID = json['BookID'];
    koleksiID = json['KoleksiID'];
    buku = json['Buku'] != null ? Buku.fromJson(json['Buku']) : null;
    user = json['User'] != null ? User.fromJson(json['User']) : null;
  }
  int? userID;
  int? bookID;
  int? koleksiID;
  Buku? buku;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserID'] = userID;
    map['BookID'] = bookID;
    map['KoleksiID'] = koleksiID;
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