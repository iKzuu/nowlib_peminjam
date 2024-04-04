/// message : "Kategori relasi found successfully"
/// data : {"Buku":{"BookID":11,"Judul":"Kimetsu no Yaiba","Penulis":"Koyoharu Gotōge","Penerbit":"Shueisha","Gambar":"https://upload.wikimedia.org/wikipedia/id/0/09/Demon_Slayer_-_Kimetsu_no_Yaiba%2C_volume_1.jpg","Deskripsi":" ","Tahunterbit":"2016","Jumlahhlmn":23},"Kategoribuku":{"KategoriID":3,"NamaKategori":"Fiksi"},"Genre":{"GenreID":1,"Namagenre":"Manga Komik"}}

class ResponseDetailrelasi {
  ResponseDetailrelasi({
      this.message, 
      this.data,});

  ResponseDetailrelasi.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataDetailrelasi.fromJson(json['data']) : null;
  }
  String? message;
  DataDetailrelasi? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// Buku : {"BookID":11,"Judul":"Kimetsu no Yaiba","Penulis":"Koyoharu Gotōge","Penerbit":"Shueisha","Gambar":"https://upload.wikimedia.org/wikipedia/id/0/09/Demon_Slayer_-_Kimetsu_no_Yaiba%2C_volume_1.jpg","Deskripsi":" ","Tahunterbit":"2016","Jumlahhlmn":23}
/// Kategoribuku : {"KategoriID":3,"NamaKategori":"Fiksi"}
/// Genre : {"GenreID":1,"Namagenre":"Manga Komik"}

class DataDetailrelasi {
  DataDetailrelasi({
      this.buku, 
      this.kategoribuku, 
      this.genre,});

  DataDetailrelasi.fromJson(dynamic json) {
    buku = json['Buku'] != null ? Buku.fromJson(json['Buku']) : null;
    kategoribuku = json['Kategoribuku'] != null ? Kategoribuku.fromJson(json['Kategoribuku']) : null;
    genre = json['Genre'] != null ? Genre.fromJson(json['Genre']) : null;
  }
  Buku? buku;
  Kategoribuku? kategoribuku;
  Genre? genre;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (buku != null) {
      map['Buku'] = buku?.toJson();
    }
    if (kategoribuku != null) {
      map['Kategoribuku'] = kategoribuku?.toJson();
    }
    if (genre != null) {
      map['Genre'] = genre?.toJson();
    }
    return map;
  }

}

/// GenreID : 1
/// Namagenre : "Manga Komik"

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

/// KategoriID : 3
/// NamaKategori : "Fiksi"

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

/// BookID : 11
/// Judul : "Kimetsu no Yaiba"
/// Penulis : "Koyoharu Gotōge"
/// Penerbit : "Shueisha"
/// Gambar : "https://upload.wikimedia.org/wikipedia/id/0/09/Demon_Slayer_-_Kimetsu_no_Yaiba%2C_volume_1.jpg"
/// Deskripsi : " "
/// Tahunterbit : "2016"
/// Jumlahhlmn : 23

class Buku {
  Buku({
      this.bookID, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.gambar, 
      this.deskripsi, 
      this.tahunterbit, 
      this.jumlahhlmn,});

  Buku.fromJson(dynamic json) {
    bookID = json['BookID'];
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    gambar = json['Gambar'];
    deskripsi = json['Deskripsi'];
    tahunterbit = json['Tahunterbit'];
    jumlahhlmn = json['Jumlahhlmn'];
  }
  int? bookID;
  String? judul;
  String? penulis;
  String? penerbit;
  String? gambar;
  String? deskripsi;
  String? tahunterbit;
  int? jumlahhlmn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BookID'] = bookID;
    map['Judul'] = judul;
    map['Penulis'] = penulis;
    map['Penerbit'] = penerbit;
    map['Gambar'] = gambar;
    map['Deskripsi'] = deskripsi;
    map['Tahunterbit'] = tahunterbit;
    map['Jumlahhlmn'] = jumlahhlmn;
    return map;
  }

}