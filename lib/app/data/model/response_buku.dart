/// message : "Buku found successfully"
/// total : 5
/// data : [{"BookID":1,"Judul":"Pengembara Hitam","Tahunterbit":"2000","Penulis":"Mas Fuad","Jumlahhlmn":120,"Penerbit":"Ngawi SMP","Deskripsi":" ","Gambar":null},{"BookID":11,"Judul":"Kimetsu no Yaiba","Tahunterbit":"2016","Penulis":"Koyoharu Gotōge","Jumlahhlmn":23,"Penerbit":"Shueisha","Deskripsi":" ","Gambar":"https://upload.wikimedia.org/wikipedia/id/0/09/Demon_Slayer_-_Kimetsu_no_Yaiba%2C_volume_1.jpg"},{"BookID":19,"Judul":"Kokoro","Tahunterbit":"2024","Penulis":"Anang San","Jumlahhlmn":250,"Penerbit":"KZU Corp.","Deskripsi":" ","Gambar":null},{"BookID":20,"Judul":"Good Morning World","Tahunterbit":"2005","Penulis":"Burnout Syndromes","Jumlahhlmn":409,"Penerbit":"Burnout Syndromes","Deskripsi":"ini deskripsi","Gambar":null},{"BookID":21,"Judul":"Sekai","Tahunterbit":"2005","Penulis":"KZU","Jumlahhlmn":300,"Penerbit":"KZU JPN","Deskripsi":"halo! ini Deskripsi","Gambar":null}]

class ResponseBuku {
  ResponseBuku({
      this.message, 
      this.total, 
      this.data,});

  ResponseBuku.fromJson(dynamic json) {
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataBuku.fromJson(v));
      });
    }
  }
  String? message;
  int? total;
  List<DataBuku>? data;

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

/// BookID : 1
/// Judul : "Pengembara Hitam"
/// Tahunterbit : "2000"
/// Penulis : "Mas Fuad"
/// Jumlahhlmn : 120
/// Penerbit : "Ngawi SMP"
/// Deskripsi : " "
/// Gambar : null

class DataBuku {
  DataBuku({
      this.bookID, 
      this.judul, 
      this.tahunterbit, 
      this.penulis, 
      this.jumlahhlmn, 
      this.penerbit, 
      this.deskripsi, 
      this.gambar,});
  
  DataBuku.fromJson(dynamic json) {
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
  dynamic gambar;

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