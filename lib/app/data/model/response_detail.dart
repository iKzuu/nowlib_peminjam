/// message : "Book found successfully"
/// data : {"BookID":24,"Judul":"Jujutsu Kaisen","Tahunterbit":"2017","Penulis":"Gege Akutami","Jumlahhlmn":300,"Penerbit":"Shueisha","Deskripsi":"Yūji Itadori adalah seorang siswa SMA dengan atletisitas yang tidak wajar yang tinggal di Sendai bersama kakeknya. Ia sering menghindari Klub Lari karena keengganannya pada bidang atletik, me","Gambar":"https://upload.wikimedia.org/wikipedia/id/4/46/Jujutsu_kaisen.jpg"}

class ResponseDetail {
  ResponseDetail({
      this.message, 
      this.data,});

  ResponseDetail.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataDetail.fromJson(json['data']) : null;
  }
  String? message;
  DataDetail? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// BookID : 24
/// Judul : "Jujutsu Kaisen"
/// Tahunterbit : "2017"
/// Penulis : "Gege Akutami"
/// Jumlahhlmn : 300
/// Penerbit : "Shueisha"
/// Deskripsi : "Yūji Itadori adalah seorang siswa SMA dengan atletisitas yang tidak wajar yang tinggal di Sendai bersama kakeknya. Ia sering menghindari Klub Lari karena keengganannya pada bidang atletik, me"
/// Gambar : "https://upload.wikimedia.org/wikipedia/id/4/46/Jujutsu_kaisen.jpg"

class DataDetail {
  DataDetail({
      this.bookID, 
      this.judul, 
      this.tahunterbit, 
      this.penulis, 
      this.jumlahhlmn, 
      this.penerbit, 
      this.deskripsi, 
      this.gambar,});

  DataDetail.fromJson(dynamic json) {
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