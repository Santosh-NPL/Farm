/// status : "Request was successful."
/// message : "success"
/// data : {"mobile":"9821177772"}

class MobileRequestModel {
  MobileRequestModel({
      String? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  MobileRequestModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _status;
  String? _message;
  Data? _data;
MobileRequestModel copyWith({  String? status,
  String? message,
  Data? data,
}) => MobileRequestModel(  status: status ?? _status,
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

/// mobile : "9821177772"

class Data {
  Data({
      String? mobile,}){
    _mobile = mobile;
}

  Data.fromJson(dynamic json) {
    _mobile = json['mobile'];
  }
  String? _mobile;
Data copyWith({  String? mobile,
}) => Data(  mobile: mobile ?? _mobile,
);
  String? get mobile => _mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = _mobile;
    return map;
  }

}