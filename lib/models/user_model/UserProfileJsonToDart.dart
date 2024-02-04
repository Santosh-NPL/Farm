/// status : "Request was successful."
/// message : "success"
/// data : {"user":{"id":"4","profile":{"name":"Hari dash Shrestha","mobile":"9801232920","profile":null}},"roles":["farmer"]}

class UserProfileJsonToDart {
  UserProfileJsonToDart({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  UserProfileJsonToDart.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  Data? _data;
UserProfileJsonToDart copyWith({  String? status,
  String? message,
  Data? data,
}) => UserProfileJsonToDart(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  String? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// user : {"id":"4","profile":{"name":"Hari dash Shrestha","mobile":"9801232920","profile":null}}
/// roles : ["farmer"]

class Data {
  Data({
      User? user, 
      List<String>? roles,}){
    _user = user;
    _roles = roles;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _roles = json['roles'] != null ? json['roles'].cast<String>() : [];
  }
  User? _user;
  List<String>? _roles;
Data copyWith({  User? user,
  List<String>? roles,
}) => Data(  user: user ?? _user,
  roles: roles ?? _roles,
);
  User? get user => _user;
  List<String>? get roles => _roles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    map['roles'] = _roles;
    return map;
  }

}

/// id : "4"
/// profile : {"name":"Hari dash Shrestha","mobile":"9801232920","profile":null}

class User {
  User({
      String? id, 
      Profile? profile,}){
    _id = id;
    _profile = profile;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _profile = json['profile'] != null ? Profile.fromJson(json['profile']) : null;
  }
  String? _id;
  Profile? _profile;
User copyWith({  String? id,
  Profile? profile,
}) => User(  id: id ?? _id,
  profile: profile ?? _profile,
);
  String? get id => _id;
  Profile? get profile => _profile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_profile != null) {
      map['profile'] = _profile?.toJson();
    }
    return map;
  }

}

/// name : "Hari dash Shrestha"
/// mobile : "9801232920"
/// profile : null

class Profile {
  Profile({
      String? name, 
      String? mobile, 
      dynamic profile,}){
    _name = name;
    _mobile = mobile;
    _profile = profile;
}

  Profile.fromJson(dynamic json) {
    _name = json['name'];
    _mobile = json['mobile'];
    _profile = json['profile'];
  }
  String? _name;
  String? _mobile;
  dynamic _profile;
Profile copyWith({  String? name,
  String? mobile,
  dynamic profile,
}) => Profile(  name: name ?? _name,
  mobile: mobile ?? _mobile,
  profile: profile ?? _profile,
);
  String? get name => _name;
  String? get mobile => _mobile;
  dynamic get profile => _profile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['mobile'] = _mobile;
    map['profile'] = _profile;
    return map;
  }

}