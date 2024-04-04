/// message : "Login berhasil"
/// data : {"UserID":23,"Username":"Wira","Email":"wira@gmail.com","Namalengkap":"Ananda Wira H","Alamat":"Cangkul","Role":"pengguna"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjIzLCJpYXQiOjE3MDk2OTkwOTAsImV4cCI6MTcwOTcwMjY5MH0.eLeZT8SqoccD5wnXQrQcU1IEmKUKCpYzXW_XKpB_r3w"

class ResponseLogin {
  ResponseLogin({
      this.message, 
      this.data, 
      this.token,
  });

  ResponseLogin.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataLogin.fromJson(json['data']) : null;
    token = json['token'];
  }
  String? message;
  DataLogin? data;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

/// UserID : 23
/// Username : "Wira"
/// Email : "wira@gmail.com"
/// Namalengkap : "Ananda Wira H"
/// Alamat : "Cangkul"
/// Role : "pengguna"

class DataLogin {
  DataLogin({
      this.userID, 
      this.username, 
      this.email, 
      this.namalengkap, 
      this.alamat, 
      this.role,});

  DataLogin.fromJson(dynamic json) {
    userID = json['UserID'];
    username = json['Username'];
    email = json['Email'];
    namalengkap = json['Namalengkap'];
    alamat = json['Alamat'];
    role = json['Role'];
  }
  int? userID;
  String? username;
  String? email;
  String? namalengkap;
  String? alamat;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserID'] = userID;
    map['Username'] = username;
    map['Email'] = email;
    map['Namalengkap'] = namalengkap;
    map['Alamat'] = alamat;
    map['Role'] = role;
    return map;
  }

}