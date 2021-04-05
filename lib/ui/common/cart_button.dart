import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_flutter/data/models/cart_item.dart';
import 'package:grocery_flutter/ui/cart/bloc/cart_bloc.dart';

class CartButton extends StatelessWidget {
  final CartItem item;

  const CartButton({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartBloc bloc = BlocProvider.of(context);
    print("Building outer button ${item.quantity}");
    return BlocBuilder<CartBloc, CartState>(
        builder: (context, state) => state.items.containsKey(item.id)
            ? _CartButtonPresent(id: item.id, state:state, bloc: bloc)
            : ElevatedButton(onPressed: ()=>bloc.add(CartInsertItem(item)), child:Text("Add to Cart")));
  }
}

class _CartButtonPresent extends StatelessWidget {
  final String id;
  final CartState state;
  final CartBloc bloc;

  const _CartButtonPresent(
      {Key key, @required this.id, @required this.bloc, this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building button");
    final style = TextButton.styleFrom(backgroundColor: Colors.indigo,
        textStyle: const TextStyle(fontWeight: FontWeight.w800, color:Colors.white));
    return Row(
      children: [
        TextButton(
            onPressed: () {
              bloc.add(CartChangeItemAmount(id, -1));
            },
            style:style,
            child: Text("-")),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                "${state.items[id]?.quantity}",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: ()=>bloc.add(CartChangeItemAmount(id,1)),
          child:Text("+"),
          style:style,
        )
      ],
    );
  }
}
