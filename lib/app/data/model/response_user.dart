class ResponseUser {
  ResponseUser({
      this.message, 
      this.data,});

  ResponseUser.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? DataUser.fromJson(json['data']) : null;
  }
  String? message;
  DataUser? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class DataUser {
  DataUser({
      this.userID, 
      this.profile, 
      this.namalengkap, 
      this.alamat, 
      this.email, 
      this.username, 
      this.role,});

  DataUser.fromJson(dynamic json) {
    userID = json['UserID'];
    profile = json['Profile'];
    namalengkap = json['Namalengkap'];
    alamat = json['Alamat'];
    email = json['Email'];
    username = json['Username'];
    role = json['Role'];
  }
  int? userID;
  String? profile;
  String? namalengkap;
  String? alamat;
  String? email;
  String? username;
  String? role;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['UserID'] = userID;
    map['Profile'] = profile;
    map['Namalengkap'] = namalengkap;
    map['Alamat'] = alamat;
    map['Email'] = email;
    map['Username'] = username;
    map['Role'] = role;
    return map;
  }

}