
import 'package:grocery_flutter/data/models/cart_item.dart';
import 'package:grocery_flutter/data/network/firebase_cart.dart';
import 'package:sqflite/sqflite.dart';

class CartRepository{
  final CartApi api = CartApi();

  Stream<Map<String,CartItem>> watchCart() {
    print("Beginning watch");
    return api.watchItems();
  }

  addItem(CartItem item)=> api.addItem(item);

  removeItem(String id)=>api.removeItem(id);


  void updateItemCount(String id, int amount){
    api.updateItemCount(id, amount);
  }
  
  // Database db;
  //
  // CartRepository(){
  //   openDatabase('appDb.db').then((value) => db=value);
  // }

}