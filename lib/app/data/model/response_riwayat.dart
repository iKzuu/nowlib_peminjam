/// message : "Peminjaman found successfully"
/// data : [{"PinjamID":2,"UserID":4,"BookID":11,"TglPeminjaman":"2024-02-26","TglPengembalian":"2024-02-27","Status":"dipinjam","Buku":{"BookID":11,"Judul":"Kimetsu no Yaiba","Tahunterbit":"2016","Penulis":"Koyoharu Gotōge","Jumlahhlmn":23,"Penerbit":"Shueisha","Deskripsi":" ","Gambar":"https://upload.wikimedia.org/wikipedia/id/0/09/Demon_Slayer_-_Kimetsu_no_Yaiba%2C_volume_1.jpg"},"User":{"UserID":4,"Namalengkap":"Amba Lele","Alamat":"Ngawi kidul","Email":"ambalele@email.com","Username":"Amba","Role":"pengguna"}},{"PinjamID":5,"UserID":4,"BookID":1,"TglPeminjaman":"2024-03-01","TglPengembalian":"2024-03-05","Status":"dipinjam","Buku":{"BookID":1,"Judul":"Pengembara Hitam","Tahunterbit":"2000","Penulis":"Mas Fuad","Jumlahhlmn":120,"Penerbit":"Ngawi SMP","Deskripsi":" ","Gambar":null},"User":{"UserID":4,"Namalengkap":"Amba Lele","Alamat":"Ngawi kidul","Email":"ambalele@email.com","Username":"Amba","Role":"pengguna"}},{"PinjamID":9,"UserID":4,"BookID":22,"TglPeminjaman":"2024-05-17","TglPengembalian":"2024-05-20","Status":"dipinjam","Buku":{"BookID":22,"Judul":"Daffa Suray","Tahunterbit":"2024","Penulis":"Nando","Jumlahhlmn":150,"Penerbit":"SMK","Deskripsi":"Ini deskripsi","Gambar":"https://d1csarkz8obe9u.cloudfront.net/posterpreviews/black-halloween-book-cover-template-design-c19bb4f1c7e92b1a276f8a9c780f1033.webp?ts=1698273803"},"User":{"UserID":4,"Namalengkap":"Amba Lele","Alamat":"Ngawi kidul","Email":"ambalele@email.com","Username":"Amba","Role":"pengguna"}},{"PinjamID":10,"UserID":4,"BookID":23,"TglPeminjaman":"2024-03-14","TglPengembalian":"2024-03-20","Status":"dipinjam","Buku":{"BookID":23,"Judul":"Attack on Titan vol1","Tahunterbit":"2009","Penulis":"Hajime Isayama","Jumlahhlmn":34,"Penerbit":"Kodansha","Deskripsi":"Dalam suatu sejarah alternatif sekitar 1800 tahun yang lalu, seorang manusia bernama Ymir Fritz berubah menjadi raksasa mirip manusia yang dikenal sebagai Titan (巨人 Kyojin) setelah melakukan ","Gambar":"https://upload.wikimedia.org/wikipedia/id/d/d6/Shingeki_no_Kyojin_manga_volume_1.jpg"},"User":{"UserID":4,"Namalengkap":"Amba Lele","Alamat":"Ngawi kidul","Email":"ambalele@email.com","Username":"Amba","Role":"pengguna"}},{"PinjamID":12,"UserID":4,"BookID":24,"TglPeminjaman":"2024-03-14","TglPengembalian":"2024-03-16","Status":"dipinjam","Buku":{"BookID":24,"Judul":"Jujutsu Kaisen","Tahunterbit":"2017","Penulis":"Gege Akutami","Jumlahhlmn":300,"Penerbit":"Shueisha","Deskripsi":"Yūji Itadori adalah seorang siswa SMA dengan atletisitas yang tidak wajar yang tinggal di Sendai bersama kakeknya. Ia sering menghindari Klub Lari karena keengganannya pada bidang atletik, me","Gambar":"https://upload.wikimedia.org/wikipedia/id/4/46/Jujutsu_kaisen.jpg"},"User":{"UserID":4,"Namalengkap":"Amba Lele","Alamat":"Ngawi kidul","Email":"ambalele@email.com","Username":"Amba","Role":"pengguna"}},{"PinjamID":13,"UserID":4,"BookID":20,"TglPeminjaman":"2024-03-15","TglPengembalian":"2024-03-18","Status":"dipinjam","Buku":{"BookID":20,"Judul":"Road to Success","Tahunterbit":"2024","Penulis":"Seseorang","Jumlahhlmn":120,"Penerbit":"Orang Sukses","Deskripsi":"ini adalah deskripsi Road to Success","Gambar":"https://d1csarkz8obe9u.cloudfront.net/posterpreviews/road-to-success-book-cover-template-design-abfb359021b5f09bdc9b54b8df402379.webp?ts=1698304114"},"User":{"UserID":4,"Namalengkap":"Amba Lele","Alamat":"Ngawi kidul","Email":"ambalele@email.com","Username":"Amba","Role":"pengguna"}}]

class ResponseRiwayat {
  ResponseRiwayat({
      this.message, 
      this.data,});

  ResponseRiwayat.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataRiwayat.fromJson(v));
      });
    }
  }
  String? message;
  List<DataRiwayat>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
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
/// User : {"UserID":4,"Namalengkap":"Amba Lele","Alamat":"Ngawi kidul","Email":"ambalele@email.com","Username":"Amba","Role":"pengguna"}

class DataRiwayat {
  DataRiwayat({
      this.pinjamID, 
      this.userID, 
      this.bookID, 
      this.tglPeminjaman, 
      this.tglPengembalian, 
      this.status, 
      this.buku, 
      this.user,});

  DataRiwayat.fromJson(dynamic json) {
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

/// UserID : 4
/// Namalengkap : "Amba Lele"
/// Alamat : "Ngawi kidul"
/// Email : "ambalele@email.com"
/// Username : "Amba"
/// Role : "pengguna"

class User {
  User({
      this.userID, 
      this.namalengkap, 
      this.alamat, 
      this.email, 
      this.username, 
      this.role,});

  User.fromJson(dynamic json) {
    userID = json['UserID'];
    namalengkap = json['Namalengkap'];
    alamat = json['Alamat'];
    email = json['Email'];
    username = json['Username'];
    role = json['Role'];
  }
  int? userID;
  String? namalengkap;
  String? alamat;
  String? email;
  String? username;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserID'] = userID;
    map['Namalengkap'] = namalengkap;
    map['Alamat'] = alamat;
    map['Email'] = email;
    map['Username'] = username;
    map['Role'] = role;
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