import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_flutter/ui/common/drawer.dart';

import 'bloc/cart_bloc.dart';

class CartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartBloc bloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(title:Text("Cart")),
      drawer: AppDrawer(),
      body: BlocListener<CartBloc, CartState>(
        listener: (context,state)=>
          ListView(
            children: [

            ],
          )
      )
    );
  }
}