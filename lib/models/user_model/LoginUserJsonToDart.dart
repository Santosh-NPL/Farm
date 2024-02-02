class LoginUserJsonToDart {
  String? status;
  String? message;
  Data? data;

  LoginUserJsonToDart({
    this.status,
    this.message,
    this.data,
  });

  LoginUserJsonToDart.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  User? user;
  List<String>? roles;
  List<dynamic>? permissions;
  List<dynamic>? farm;
  String? token;

  Data({
    this.user,
    this.roles,
    this.permissions,
    this.farm,
    this.token,
  });

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    roles = json['roles'] != null ? List<String>.from(json['roles']) : [];
    permissions = json['permissions'] != null ? List<dynamic>.from(json['permissions']) : [];
    farm = json['farm'] != null ? List<dynamic>.from(json['farm']) : [];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['roles'] = roles;
    map['permissions'] = permissions;
    map['farm'] = farm;
    map['token'] = token;
    return map;
  }
}

class User {
  String? id;
  Profile? profile;

  User({
    this.id,
    this.profile,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (profile != null) {
      map['profile'] = profile?.toJson();
    }
    return map;
  }
}

class Profile {
  String? name;
  String? mobile;
  dynamic email;
  String? createdAt;

  Profile({
    this.name,
    this.mobile,
    this.email,
    this.createdAt,
  });

  Profile.fromJson(dynamic json) {
    name = json['name'];
    mobile = json['mobile'];
    email = json['email'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['mobile'] = mobile;
    map['email'] = email;
    map['created_at'] = createdAt;
    return map;
  }
}
