import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_flutter/ui/cart/bloc/cart_bloc.dart';

class CartSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
        final total = state.total;
        final subtotal = state.subtotal;
        return Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text("Subtotal"),
                  SizedBox(height:8),
                  Text("You Saved"),
                  SizedBox(height:8),
                  Text("Total"),
                ]),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("\$${subtotal.toStringAsFixed(2)}"),
                      SizedBox(height:8),
                      Text("\$${(subtotal - total).toStringAsFixed(2)}"),
                      SizedBox(height:8),
                      Text("\$${total.toStringAsFixed(2)}")
                    ],
                  ),
                )
              ],
            ));
      }),
    );
  }
}
