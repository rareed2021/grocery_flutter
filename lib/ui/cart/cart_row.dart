import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grocery_flutter/data/models/cart_item.dart';
import 'package:grocery_flutter/data/network/endpoints.dart';
import 'package:grocery_flutter/ui/common/cart_button.dart';

import 'bloc/cart_bloc.dart';

class CartRow extends StatelessWidget {
  final CartBloc bloc;
  final CartItem item;

  const CartRow({Key key, this.bloc, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final hasDiscount = item.mrp!=item.price;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children:[
      CachedNetworkImage(imageUrl:Endpoints.imageUrl(item.image),
          width:100,
        height:100,
          ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Text(item.productName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(children:[
                  if(!hasDiscount)
                    Text("\$${item.price}"),
                  if(hasDiscount)
                    Text("\$${item.mrp}",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  if(hasDiscount)
                    Text(" \$${item.price}",
                      style:TextStyle(color:Colors.red, fontWeight: FontWeight.w700)
                    ),
                  ]),
                ),
                Align(
                  alignment:Alignment.centerRight,
                    child: CartButton(item:item, width:125))
              ],
            )
          ]
        ),
      )
    ]);
  }
}
