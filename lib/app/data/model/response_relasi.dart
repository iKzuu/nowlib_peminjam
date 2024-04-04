/// message : "kategori relasi found successfully"
/// total : 3
/// data : [{"KategorirelasiID":1,"Buku":{"BookID":1,"Judul":"Pengembara Hitam","Penulis":"Mas Fuad","Penerbit":"Ngawi SMP","Gambar":null,"Deskripsi":" "},"Kategoribuku":{"KategoriID":1,"NamaKategori":"Non Fiksi"},"Genre":{"GenreID":1,"Namagenre":"Manga Komik"}},{"KategorirelasiID":3,"Buku":{"BookID":11,"Judul":"Kimetsu no Yaiba","Penulis":"Koyoharu Gotōge","Penerbit":"Shueisha","Gambar":"https://upload.wikimedia.org/wikipedia/id/0/09/Demon_Slayer_-_Kimetsu_no_Yaiba%2C_volume_1.jpg","Deskripsi":" "},"Kategoribuku":{"KategoriID":3,"NamaKategori":"Fiksi"},"Genre":{"GenreID":1,"Namagenre":"Manga Komik"}},{"KategorirelasiID":4,"Buku":{"BookID":24,"Judul":"Jujutsu Kaisen","Penulis":"Gege Akutami","Penerbit":"Shueisha","Gambar":"https://upload.wikimedia.org/wikipedia/id/4/46/Jujutsu_kaisen.jpg","Deskripsi":"Yūji Itadori adalah seorang siswa SMA dengan atletisitas yang tidak wajar yang tinggal di Sendai bersama kakeknya. Ia sering menghindari Klub Lari karena keengganannya pada bidang atletik, me"},"Kategoribuku":{"KategoriID":1,"NamaKategori":"Non Fiksi"},"Genre":{"GenreID":1,"Namagenre":"Manga Komik"}},{"KategorirelasiID":5,"Buku":{"BookID":23,"Judul":"Attack on Titan vol1","Penulis":"Hajime Isayama","Penerbit":"Kodansha","Gambar":"https://upload.wikimedia.org/wikipedia/id/d/d6/Shingeki_no_Kyojin_manga_volume_1.jpg","Deskripsi":"Dalam suatu sejarah alternatif sekitar 1800 tahun yang lalu, seorang manusia bernama Ymir Fritz berubah menjadi raksasa mirip manusia yang dikenal sebagai Titan (巨人 Kyojin) setelah melakukan "},"Kategoribuku":{"KategoriID":1,"NamaKategori":"Non Fiksi"},"Genre":{"GenreID":1,"Namagenre":"Manga Komik"}}]

class ResponseRelasi {
  ResponseRelasi({
      this.message, 
      this.total, 
      this.data,});

  ResponseRelasi.fromJson(dynamic json) {
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataRelasi.fromJson(v));
      });
    }
  }
  String? message;
  int? total;
  List<DataRelasi>? data;

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

/// KategorirelasiID : 1
/// Buku : {"BookID":1,"Judul":"Pengembara Hitam","Penulis":"Mas Fuad","Penerbit":"Ngawi SMP","Gambar":null,"Deskripsi":" "}
/// Kategoribuku : {"KategoriID":1,"NamaKategori":"Non Fiksi"}
/// Genre : {"GenreID":1,"Namagenre":"Manga Komik"}

class DataRelasi {
  DataRelasi({
      this.kategorirelasiID, 
      this.buku, 
      this.kategoribuku, 
      this.genre,});

  DataRelasi.fromJson(dynamic json) {
    kategorirelasiID = json['KategorirelasiID'];
    buku = json['Buku'] != null ? Buku.fromJson(json['Buku']) : null;
    kategoribuku = json['Kategoribuku'] != null ? Kategoribuku.fromJson(json['Kategoribuku']) : null;
    genre = json['Genre'] != null ? Genre.fromJson(json['Genre']) : null;
  }
  int? kategorirelasiID;
  Buku? buku;
  Kategoribuku? kategoribuku;
  Genre? genre;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['KategorirelasiID'] = kategorirelasiID;
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

/// KategoriID : 1
/// NamaKategori : "Non Fiksi"

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

/// BookID : 1
/// Judul : "Pengembara Hitam"
/// Penulis : "Mas Fuad"
/// Penerbit : "Ngawi SMP"
/// Gambar : null
/// Deskripsi : " "

class Buku {
  Buku({
      this.bookID, 
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.gambar, 
      this.deskripsi,});

  Buku.fromJson(dynamic json) {
    bookID = json['BookID'];
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    gambar = json['Gambar'];
    deskripsi = json['Deskripsi'];
  }
  int? bookID;
  String? judul;
  String? penulis;
  String? penerbit;
  dynamic gambar;
  String? deskripsi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['BookID'] = bookID;
    map['Judul'] = judul;
    map['Penulis'] = penulis;
    map['Penerbit'] = penerbit;
    map['Gambar'] = gambar;
    map['Deskripsi'] = deskripsi;
    return map;
  }

}