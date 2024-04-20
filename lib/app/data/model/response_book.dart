class ResponseBook {
  ResponseBook({
      this.message, 
      this.data,});

  ResponseBook.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataBook.fromJson(json['data']) : null;
  }
  String? message;
  DataBook? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class DataBook {
  DataBook({
      this.bookID, 
      this.judul, 
      this.tahunterbit, 
      this.penulis, 
      this.jumlahhlmn, 
      this.penerbit, 
      this.deskripsi, 
      this.gambar, 
      this.kategoribukurelasi, 
      this.ulasan,});

  DataBook.fromJson(dynamic json) {
    bookID = json['BookID'];
    judul = json['Judul'];
    tahunterbit = json['Tahunterbit'];
    penulis = json['Penulis'];
    jumlahhlmn = json['Jumlahhlmn'];
    penerbit = json['Penerbit'];
    deskripsi = json['Deskripsi'];
    gambar = json['Gambar'];
    if (json['Kategoribukurelasi'] != null) {
      kategoribukurelasi = [];
      json['Kategoribukurelasi'].forEach((v) {
        kategoribukurelasi?.add(Kategoribukurelasi.fromJson(v));
      });
    }
    if (json['Ulasan'] != null) {
      ulasan = [];
      json['Ulasan'].forEach((v) {
        ulasan?.add(Ulasan.fromJson(v));
      });
    }
  }
  int? bookID;
  String? judul;
  String? tahunterbit;
  String? penulis;
  int? jumlahhlmn;
  String? penerbit;
  String? deskripsi;
  String? gambar;
  List<Kategoribukurelasi>? kategoribukurelasi;
  List<Ulasan>? ulasan;

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
    if (kategoribukurelasi != null) {
      map['Kategoribukurelasi'] = kategoribukurelasi?.map((v) => v.toJson()).toList();
    }
    if (ulasan != null) {
      map['Ulasan'] = ulasan?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Ulasan {
  Ulasan({
      this.ulasanID, 
      this.userID, 
      this.bookID, 
      this.tglreview, 
      this.ulasan, 
      this.rating, 
      this.user,});

  Ulasan.fromJson(dynamic json) {
    ulasanID = json['UlasanID'];
    userID = json['UserID'];
    bookID = json['BookID'];
    tglreview = json['Tglreview'];
    ulasan = json['Ulasan'];
    rating = json['Rating'];
    user = json['User'] != null ? User.fromJson(json['User']) : null;
  }
  int? ulasanID;
  int? userID;
  int? bookID;
  String? tglreview;
  String? ulasan;
  int? rating;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UlasanID'] = ulasanID;
    map['UserID'] = userID;
    map['BookID'] = bookID;
    map['Tglreview'] = tglreview;
    map['Ulasan'] = ulasan;
    map['Rating'] = rating;
    if (user != null) {
      map['User'] = user?.toJson();
    }
    return map;
  }

}

class User {
  User({
      this.profile, 
      this.namalengkap, 
      this.username, 
      this.alamat, 
      this.email, 
      this.role,});

  User.fromJson(dynamic json) {
    profile = json['Profile'];
    namalengkap = json['Namalengkap'];
    username = json['Username'];
    alamat = json['Alamat'];
    email = json['Email'];
    role = json['Role'];
  }
  dynamic profile;
  String? namalengkap;
  String? username;
  String? alamat;
  String? email;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Profile'] = profile;
    map['Namalengkap'] = namalengkap;
    map['Username'] = username;
    map['Alamat'] = alamat;
    map['Email'] = email;
    map['Role'] = role;
    return map;
  }

}

class Kategoribukurelasi {
  Kategoribukurelasi({
      this.kategoribuku, 
      this.genre,});

  Kategoribukurelasi.fromJson(dynamic json) {
    kategoribuku = json['Kategoribuku'] != null ? Kategoribuku.fromJson(json['Kategoribuku']) : null;
    genre = json['Genre'] != null ? Genre.fromJson(json['Genre']) : null;
  }
  Kategoribuku? kategoribuku;
  Genre? genre;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (kategoribuku != null) {
      map['Kategoribuku'] = kategoribuku?.toJson();
    }
    if (genre != null) {
      map['Genre'] = genre?.toJson();
    }
    return map;
  }

}

class Genre {
  Genre({
      this.genreID, 
      this.namagenre,});

  Genre.fromJson(dynamic json) {
    genreID = json['GenreID'];
    namagenre = json['Namagenre'];
  }
  int? genreID;
  String? namagenre;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['GenreID'] = genreID;
    map['Namagenre'] = namagenre;
    return map;
  }

}

class Kategoribuku {
  Kategoribuku({
      this.kategoriID, 
      this.namaKategori,});

  Kategoribuku.fromJson(dynamic json) {
    kategoriID = json['KategoriID'];
    namaKategori = json['NamaKategori'];
  }
  int? kategoriID;
  String? namaKategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KategoriID'] = kategoriID;
    map['NamaKategori'] = namaKategori;
    return map;
  }

}