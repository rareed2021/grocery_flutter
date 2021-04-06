import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_flutter/ui/cart/cart_row.dart';
import 'package:grocery_flutter/ui/cart/cart_summary.dart';
import 'package:grocery_flutter/ui/common/drawer.dart';

import 'bloc/cart_bloc.dart';

class CheckoutPage extends StatelessWidget {
  static const route = "/cart";
  @override
  Widget build(BuildContext context) {
    final CartBloc bloc = BlocProvider.of(context);
    return Scaffold(
        appBar: AppBar(title: Text("Cart")),
        drawer: AppDrawer(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
            children: [
          Expanded(
            child: CartList()
          ),
          CartSummary(),
          Row(
              children:[Expanded(child: ElevatedButton(child: Text("Check Out")))]
          )
          ])
        );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
        builder: (context, state) => ListView(
          children:
          state.items.values
              .map((value) => CartRow(item: value))
              .toList(),
        ));
  }
}
