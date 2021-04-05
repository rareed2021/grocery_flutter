/// error : false
/// user : {"firstName":"jason","_id":"5e53e8cde4d77e0017d85a96","email":"Sidhant1@163.com","password":"123456789","mobile":"2222","created":"2020-02-24T15:16:29.462Z","address":[],"__v":0,"createdAt":"2021-03-07T19:35:14.276Z"}

class AuthResponse {
  bool _error;
  User _user;
  String _message;

  bool get error => _error;
  User get user => _user;
  String get message => _message;

  AuthResponse({
      bool error,
      User user,
      String message,}){
    _error = error;
    _user = user;
    _message = message;
}

  AuthResponse.fromJson(dynamic json) {
    _error = json["error"];
    _user = json["user"] != null ? User.fromJson(json["user"]) : null;
    _message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["error"] = _error;
    if (_user != null) {
      map["user"] = _user.toJson();
    }
    map["message"] = _message;
    return map;
  }

}

/// firstName : "jason"
/// _id : "5e53e8cde4d77e0017d85a96"
/// email : "Sidhant1@163.com"
/// password : "123456789"
/// mobile : "2222"
/// created : "2020-02-24T15:16:29.462Z"
/// address : []
/// __v : 0
/// createdAt : "2021-03-07T19:35:14.276Z"

class User {
  String _firstName;
  String _id;
  String _email;
  String _password;
  String _mobile;
  String _created;
  int _v;
  String _createdAt;

  String get firstName => _firstName;
  String get id => _id;
  String get email => _email;
  String get password => _password;
  String get mobile => _mobile;
  String get created => _created;
  int get v => _v;
  String get createdAt => _createdAt;

  User({
      String firstName, 
      String id, 
      String email, 
      String password, 
      String mobile, 
      String created,
      int v, 
      String createdAt}){
    _firstName = firstName;
    _id = id;
    _email = email;
    _password = password;
    _mobile = mobile;
    _created = created;
    _v = v;
    _createdAt = createdAt;
}

  User.fromJson(dynamic json) {
    _firstName = json["firstName"];
    _id = json["_id"];
    _email = json["email"];
    _password = json["password"];
    _mobile = json["mobile"];
    _created = json["created"];
    _v = json["__v"];
    _createdAt = json["createdAt"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["firstName"] = _firstName;
    map["_id"] = _id;
    map["email"] = _email;
    map["password"] = _password;
    map["mobile"] = _mobile;
    map["created"] = _created;
    map["__v"] = _v;
    map["createdAt"] = _createdAt;
    return map;
  }

}