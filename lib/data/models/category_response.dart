/// error : false
/// count : 5
/// data : [{"catImage":"category_chicken.jpg","catDescription":"","position":1,"status":true,"_id":"5de491ab69ee2123b48daae7","catId":1,"catName":"Chicken Items","slug":"Chicken","__v":0},{"catImage":"category_veg.jpg","catDescription":"","position":1,"status":true,"_id":"5de491c069ee2123b48daae8","catId":2,"catName":"Veg Items","slug":"Veg","__v":0},{"catImage":"category_fruits.jpeg","catDescription":"","position":1,"status":true,"_id":"5de491ce69ee2123b48daae9","catId":3,"catName":"Fruit Items","slug":"Fruits","__v":0},{"catImage":"category_beef.jpg","catDescription":"","position":1,"status":true,"_id":"5de491d869ee2123b48daaea","catId":4,"catName":"Beef Item","slug":"BEEF","__v":0},{"catImage":"category_sehri.jpg","catDescription":"","position":1,"status":true,"_id":"5e9c800183b46e00174af054","catId":5,"catName":"Sehri","slug":"Sehri","__v":0}]

class CategoryResponse {
  bool _error;
  int _count;
  List<Category> _data;

  bool get error => _error;
  int get count => _count;
  List<Category> get data => _data;

  CategoryResponse({
      bool error, 
      int count, 
      List<Category> data}){
    _error = error;
    _count = count;
    _data = data;
}

  CategoryResponse.fromJson(dynamic json) {
    _error = json["error"];
    _count = json["count"];
    if (json["data"] != null) {
      _data = [];
      json["data"].forEach((v) {
        _data.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["error"] = _error;
    map["count"] = _count;
    if (_data != null) {
      map["data"] = _data.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// catImage : "category_chicken.jpg"
/// catDescription : ""
/// position : 1
/// status : true
/// _id : "5de491ab69ee2123b48daae7"
/// catId : 1
/// catName : "Chicken Items"
/// slug : "Chicken"
/// __v : 0

class Category {
  String _catImage;
  String _catDescription;
  int _position;
  bool _status;
  String _id;
  int _catId;
  String _catName;
  String _slug;
  int _v;

  String get catImage => _catImage;
  String get catDescription => _catDescription;
  int get position => _position;
  bool get status => _status;
  String get id => _id;
  int get catId => _catId;
  String get catName => _catName;
  String get slug => _slug;
  int get v => _v;

  Category({
      String catImage, 
      String catDescription, 
      int position, 
      bool status, 
      String id, 
      int catId, 
      String catName, 
      String slug, 
      int v}){
    _catImage = catImage;
    _catDescription = catDescription;
    _position = position;
    _status = status;
    _id = id;
    _catId = catId;
    _catName = catName;
    _slug = slug;
    _v = v;
}

  Category.fromJson(dynamic json) {
    _catImage = json["catImage"];
    _catDescription = json["catDescription"];
    _position = json["position"];
    _status = json["status"];
    _id = json["_id"];
    _catId = json["catId"];
    _catName = json["catName"];
    _slug = json["slug"];
    _v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["catImage"] = _catImage;
    map["catDescription"] = _catDescription;
    map["position"] = _position;
    map["status"] = _status;
    map["_id"] = _id;
    map["catId"] = _catId;
    map["catName"] = _catName;
    map["slug"] = _slug;
    map["__v"] = _v;
    return map;
  }

}