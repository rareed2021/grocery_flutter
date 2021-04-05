import 'package:flutter/material.dart';
import 'package:grocery_flutter/ui/cart/cart_icon.dart';

class CartAppBar extends AppBar{
  CartAppBar(String title):super(title: Text(title), actions: [CartIcon()]);
}