/// message : "User created successfully"
/// data : {"UserID":13,"Username":"Test","Email":"penggunatest@email.com","Namalengkap":"Testing","Password":"$2b$10$i9WrGXrYtysUO84wXvP1r.7ZFJikNeKXLh8oRVGXCq5MdSBJ.RH1K","Alamat":"System","Role":"pengguna"}

class ResponseRegister {
  ResponseRegister({
      this.message, 
      this.data,});

  ResponseRegister.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataRegister.fromJson(json['data']) : null;
  }
  String? message;
  DataRegister? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// UserID : 13
/// Username : "Test"
/// Email : "penggunatest@email.com"
/// Namalengkap : "Testing"
/// Password : "$2b$10$i9WrGXrYtysUO84wXvP1r.7ZFJikNeKXLh8oRVGXCq5MdSBJ.RH1K"
/// Alamat : "System"
/// Role : "pengguna"

class DataRegister {
  DataRegister({
      this.userID, 
      this.username, 
      this.email, 
      this.namalengkap, 
      this.password, 
      this.alamat, 
      this.role,});

  DataRegister.fromJson(dynamic json) {
    userID = json['UserID'];
    username = json['Username'];
    email = json['Email'];
    namalengkap = json['Namalengkap'];
    password = json['Password'];
    alamat = json['Alamat'];
    role = json['Role'];
  }
  int? userID;
  String? username;
  String? email;
  String? namalengkap;
  String? password;
  String? alamat;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserID'] = userID;
    map['Username'] = username;
    map['Email'] = email;
    map['Namalengkap'] = namalengkap;
    map['Password'] = password;
    map['Alamat'] = alamat;
    map['Role'] = role;
    return map;
  }

}