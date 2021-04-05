

class CartItem {
  int _quantity;
  String _description;
  String _id;
  int _catId;
  int _subId;
  String _productName;
  String _image;
  String _unit;
  double _price;
  double _mrp;

  int get quantity => _quantity;

  String get description => _description;

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  // String get id => _id;
  //   set(value){ _id=value;};

  int get catId => _catId;

  int get subId => _subId;

  String get productName => _productName;

  String get image => _image;

  String get unit => _unit;

  double get price => _price;

  double get mrp => _mrp;


  CartItem({
    int quantity,
    String description,
    String id,
    int catId,
    int subId,
    String productName,
    String image,
    String unit,
    double price,
    double mrp,}) {
    _quantity = quantity;
    _description = description;
    _id = id;
    _catId = catId;
    _subId = subId;
    _productName = productName;
    _image = image;
    _unit = unit;
    _price = price;
    _mrp = mrp;
  }

  CartItem.fromJson(dynamic json) {
    _quantity = json["quantity"];
    _description = json["description"];
    _id = json["_id"];
    _catId = json["catId"];
    _subId = json["subId"];
    _productName = json["productName"];
    _image = json["image"];
    _unit = json["unit"];
    _price = json["price"].toDouble();
    _mrp = json["mrp"].toDouble();
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["quantity"] = _quantity;
    map["description"] = _description;
    map["_id"] = _id;
    map["catId"] = _catId;
    map["subId"] = _subId;
    map["productName"] = _productName;
    map["image"] = _image;
    map["unit"] = _unit;
    map["price"] = _price;
    map["mrp"] = _mrp;
    return map;
  }


}