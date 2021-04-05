/// error : false
/// count : 9
/// message : ""
/// data : [{"subImage":"","subDescription":"","status":true,"position":1,"_id":"5de4921c69ee2123b48daaeb","catId":1,"subId":1,"subName":"Fried","__v":0},{"subImage":"","subDescription":"","status":true,"position":1,"_id":"5de4923469ee2123b48daaec","catId":1,"subId":2,"subName":"Barbeque","__v":0},{"subImage":"","subDescription":"","status":true,"position":1,"_id":"5de4924469ee2123b48daaed","catId":1,"subId":3,"subName":"Combos","__v":0},{"subImage":"","subDescription":"","status":true,"position":1,"_id":"5de4924d69ee2123b48daaee","catId":2,"subId":4,"subName":"Veg Fried","__v":0},{"subImage":"","subDescription":"","status":true,"position":1,"_id":"5de4925969ee2123b48daaef","catId":2,"subId":5,"subName":"Veg Combos","__v":0},{"subImage":"","subDescription":"","status":true,"position":1,"_id":"5de4927f69ee2123b48daaf1","catId":3,"subId":7,"subName":"Fruits","__v":0},{"subImage":"","subDescription":"","status":true,"position":1,"_id":"5de4928869ee2123b48daaf2","catId":3,"subId":8,"subName":"Vegetables","__v":0},{"subImage":"","subDescription":"","status":true,"position":1,"_id":"5de4929169ee2123b48daaf3","catId":4,"subId":9,"subName":"Beef Kababs","__v":0},{"subImage":"","subDescription":"","status":true,"position":1,"_id":"5de4929a69ee2123b48daaf4","catId":4,"subId":10,"subName":"Beef Combos","__v":0}]

class SubcategoryResponse {
  bool _error;
  int _count;
  String _message;
  List<SubCategory> _data;

  bool get error => _error;
  int get count => _count;
  String get message => _message;
  List<SubCategory> get data => _data;

  SubcategoryResponse({
      bool error, 
      int count, 
      String message, 
      List<SubCategory> data}){
    _error = error;
    _count = count;
    _message = message;
    _data = data;
}

  SubcategoryResponse.fromJson(dynamic json) {
    _error = json["error"];
    _count = json["count"];
    _message = json["message"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(SubCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["error"] = _error;
    map["count"] = _count;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// subImage : ""
/// subDescription : ""
/// status : true
/// position : 1
/// _id : "5de4921c69ee2123b48daaeb"
/// catId : 1
/// subId : 1
/// subName : "Fried"
/// __v : 0

class SubCategory {
  String _subImage;
  String _subDescription;
  bool _status;
  int _position;
  String _id;
  int _catId;
  int _subId;
  String _subName;
  int _v;

  String get subImage => _subImage;
  String get subDescription => _subDescription;
  bool get status => _status;
  int get position => _position;
  String get id => _id;
  int get catId => _catId;
  int get subId => _subId;
  String get subName => _subName;
  int get v => _v;

  SubCategory({
      String subImage, 
      String subDescription, 
      bool status, 
      int position, 
      String id, 
      int catId, 
      int subId, 
      String subName, 
      int v}){
    _subImage = subImage;
    _subDescription = subDescription;
    _status = status;
    _position = position;
    _id = id;
    _catId = catId;
    _subId = subId;
    _subName = subName;
    _v = v;
}

  SubCategory.fromJson(dynamic json) {
    _subImage = json["subImage"];
    _subDescription = json["subDescription"];
    _status = json["status"];
    _position = json["position"];
    _id = json["_id"];
    _catId = json["catId"];
    _subId = json["subId"];
    _subName = json["subName"];
    _v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["subImage"] = _subImage;
    map["subDescription"] = _subDescription;
    map["status"] = _status;
    map["position"] = _position;
    map["_id"] = _id;
    map["catId"] = _catId;
    map["subId"] = _subId;
    map["subName"] = _subName;
    map["__v"] = _v;
    return map;
  }

}