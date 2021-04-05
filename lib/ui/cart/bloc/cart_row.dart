import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery_flutter/data/models/cart_item.dart';
import 'package:grocery_flutter/data/network/endpoints.dart';

import 'cart_bloc.dart';

class CartRow extends StatelessWidget {
  final CartBloc bloc;
  final CartItem item;

  const CartRow({Key key, this.bloc, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children:[
      CachedNetworkImage(imageUrl:Endpoints.imageUrl(item.image),
          width:100,
        height:100,
          ),
      Text(item.productName)
    ]);
  }
}
