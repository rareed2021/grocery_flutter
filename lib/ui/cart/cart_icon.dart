import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_flutter/ui/cart/bloc/cart_bloc.dart';
import 'package:grocery_flutter/ui/cart/cart_list.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap:(){
          Navigator.pushNamed(context, CheckoutPage.route);
        },
        child: BlocBuilder<CartBloc,CartState>(builder: (context,state)=>
          Container(
            margin: EdgeInsets.symmetric(horizontal: 6),
            width: 40,
            height: 40,
            child: Stack(
              children: [
                Align(
                  alignment:Alignment.center,
                    child: Icon(Icons.shopping_cart_rounded, size:35)),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    child:Text(state.items.length.toString(),
                      style:TextStyle(color:Colors.white)
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.indigo
                    ),
                  ),
                )
              ],
            ),
          )
    ),
      );
  }
}
