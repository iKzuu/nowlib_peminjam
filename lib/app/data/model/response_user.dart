/// message : "User found successfully"
/// data : {"UserID":6,"Namalengkap":"Admin Perpus","Alamat":"SMK N 5 Surakarta","Email":"adminsmk5@email.com","Username":"Admin","Role":"admin"}

class ResponseUser {
  ResponseUser({
      this.message, 
      this.data,});

  ResponseUser.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// UserID : 6
/// Namalengkap : "Admin Perpus"
/// Alamat : "SMK N 5 Surakarta"
/// Email : "adminsmk5@email.com"
/// Username : "Admin"
/// Role : "admin"

class Data {
  Data({
      this.userID, 
      this.namalengkap, 
      this.alamat, 
      this.email, 
      this.username, 
      this.role,});

  Data.fromJson(dynamic json) {
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