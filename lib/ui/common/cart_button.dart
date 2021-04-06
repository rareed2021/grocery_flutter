import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_flutter/data/models/cart_item.dart';
import 'package:grocery_flutter/ui/cart/bloc/cart_bloc.dart';

class CartButton extends StatelessWidget {
  final CartItem item;
  final double width;

  const CartButton({Key key, this.item, this.width=250}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartBloc bloc = BlocProvider.of(context);
    print("Building outer button ${item.quantity}");
    return BlocBuilder<CartBloc, CartState>(
        builder: (context, state) => state.items.containsKey(item.id)
            ? _CartButtonPresent(id: item.id, state: state, bloc: bloc, width:width)
            : ElevatedButton(
                onPressed: () => bloc.add(CartInsertItem(item)),
                child: Text("Add to Cart")));
  }
}

class _CartButtonPresent extends StatelessWidget {
  final double width;
  final String id;
  final CartState state;
  final CartBloc bloc;

  const _CartButtonPresent(
      {Key key,
      @required this.id,
      @required this.bloc,
      this.state,
      this.width = 250})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building button");
    return Container(
      width: width,
      child: Row(
        children: [
          _ContainerButton("-",
              left:true,
              onPressed: () {
                bloc.add(CartChangeItemAmount(id, -1));
              },
      ),
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
        _ContainerButton("+",
            onPressed: () => bloc.add(CartChangeItemAmount(id, 1)),
            left:false
          )
        ],
      ),
    );
  }
}


class _ContainerButton extends StatelessWidget {
  final String text;
  final bool left;
  final void Function() onPressed;

  const _ContainerButton(this.text,{Key key, this.left, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final rad = const Radius.circular(5);
    final borderStyle = const BorderSide(color:Colors.blueAccent, width: 1.0);
    final BorderRadius radius = left ? BorderRadius.only(topLeft: rad, bottomLeft: rad)
        : BorderRadius.only(topRight: rad, bottomRight: rad);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        decoration: BoxDecoration(
          borderRadius: radius,
          border:Border.all(color:Colors.indigo, width: 1.0),
          shape:BoxShape.rectangle
        ),
        child: Text(text,
        style:const TextStyle(fontWeight: FontWeight.w800, color: Colors.black)),
      ),
    );
  }
}
