import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_flutter/data/models/product_response.dart';
import 'package:grocery_flutter/data/network/endpoints.dart';
import 'package:grocery_flutter/ui/cart/bloc/cart_bloc.dart';
import 'package:grocery_flutter/ui/common/cart_button.dart';

class ProductRow extends StatelessWidget {
  final Product _product;

  @override
  Widget build(BuildContext context) {
    final CartBloc bloc = BlocProvider.of(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl:Endpoints.imageUrl(_product.image),
            width: 120,
          ),
          Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(children: [
                      Text(_product.productName),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("\$${_product.price}"))
                    ]),
                    Text(
                      _product.description,
                      softWrap: true,
                      maxLines: 3,
                    ),
                    CartButton(item:_product.toCartItem())
                    // ElevatedButton(onPressed: () =>
                    //     bloc.add(CartInsertItem(_product.toCartItem()))
                    //     , child: Text("Add To Cart"))
                  ])),
        ],
      ),
    );
  }

  ProductRow(this._product);
}
