import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:grocery_flutter/data/models/cart_item.dart';

class CartApi {
  FirebaseDatabase _db;

  String _cartPath(String uid) => "users/$uid/cart/";

  String _cartItemPath(String uid, String itemId) => "${_cartPath(uid)}$itemId";


  void addItem(CartItem item) {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      var itemRef = _db.reference().child(_cartItemPath(uid, item.id));
      itemRef.set(item.toJson());
    }
  }

  void removeItem(String id){
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      var itemRef = _db.reference().child(_cartItemPath(uid, id));
      itemRef.remove();
    }
  }

  void updateItemCount(String id, amount){
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      var itemRef = _db.reference().child(_cartItemPath(uid, id));
      final fieldRef = itemRef.child("quantity");
      fieldRef.once().then((value) =>
          fieldRef.set((value.value as int) + amount)
      );
    }
  }

  Future<Map<String,CartItem>> getItems() async {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      var userRef = _db.reference().child(_cartPath(uid));
      //get future for once, then build into
      return userRef.once().then((snapshot) =>
          (snapshot.value as Map<String, dynamic>).map((k,v) =>
              MapEntry<String,CartItem>(k,CartItem.fromJson(v)))
      );
    } else {
      return {};
    }
  }

  Stream<Map<String,CartItem>> watchItems() async* {
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      var userRef = _db.reference().child(_cartPath(uid));
      yield* userRef.onValue.map((event) {
        //map individial value to CartItem
        final Map<String,CartItem> l =Map<String,CartItem>.from(event.snapshot.value.map((k,v) {
          final item =CartItem.fromJson(v) ;
          return MapEntry<String,CartItem>(k,item);
        }));
        return l;
      });
    }
  }

  CartApi(){
    Firebase.initializeApp();
    _db = FirebaseDatabase.instance;
  }
}