/// message : "kategori relasi found successfully"
/// total : 3
/// data : [{"KategorirelasiID":1,"Buku":{"Judul":"Pengembara Hitam","Penulis":"Mas Fuad","Penerbit":"Ngawi SMP","Gambar":null,"Deskripsi":" "},"Kategoribuku":{"NamaKategori":"Non Fiksi"},"Genre":{"Namagenre":"Manga Komik"}},{"KategorirelasiID":3,"Buku":{"Judul":"Kimetsu no Yaiba","Penulis":"Koyoharu Gotōge","Penerbit":"Shueisha","Gambar":"https://upload.wikimedia.org/wikipedia/id/0/09/Demon_Slayer_-_Kimetsu_no_Yaiba%2C_volume_1.jpg","Deskripsi":" "},"Kategoribuku":{"NamaKategori":"Fiksi"},"Genre":{"Namagenre":"Manga Komik"}}]

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
/// Buku : {"Judul":"Pengembara Hitam","Penulis":"Mas Fuad","Penerbit":"Ngawi SMP","Gambar":null,"Deskripsi":" "}
/// Kategoribuku : {"NamaKategori":"Non Fiksi"}
/// Genre : {"Namagenre":"Manga Komik"}

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

/// Namagenre : "Manga Komik"

class Genre {
  Genre({
      this.namagenre,});

  Genre.fromJson(dynamic json) {
    namagenre = json['Namagenre'];
  }
  String? namagenre;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Namagenre'] = namagenre;
    return map;
  }

}

/// NamaKategori : "Non Fiksi"

class Kategoribuku {
  Kategoribuku({
      this.namaKategori,});

  Kategoribuku.fromJson(dynamic json) {
    namaKategori = json['NamaKategori'];
  }
  String? namaKategori;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['NamaKategori'] = namaKategori;
    return map;
  }

}

/// Judul : "Pengembara Hitam"
/// Penulis : "Mas Fuad"
/// Penerbit : "Ngawi SMP"
/// Gambar : null
/// Deskripsi : " "

class Buku {
  Buku({
      this.judul, 
      this.penulis, 
      this.penerbit, 
      this.gambar, 
      this.deskripsi,});

  Buku.fromJson(dynamic json) {
    judul = json['Judul'];
    penulis = json['Penulis'];
    penerbit = json['Penerbit'];
    gambar = json['Gambar'];
    deskripsi = json['Deskripsi'];
  }
  String? judul;
  String? penulis;
  String? penerbit;
  dynamic gambar;
  String? deskripsi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Judul'] = judul;
    map['Penulis'] = penulis;
    map['Penerbit'] = penerbit;
    map['Gambar'] = gambar;
    map['Deskripsi'] = deskripsi;
    return map;
  }

}