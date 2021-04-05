import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery_flutter/data/models/cart_item.dart';
import 'package:grocery_flutter/data/repositories/CartRepository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;
  CartBloc(this.repository) : super(CartInitial()){
    //begin watching upstream database. When it changes, we update cart
    print("Starting to watch cart");
    repository.watchCart().listen((items) {
      print("Got new items");
      add(CartRemoteUpdate(items));
    });
  }

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    print("got event");
    if(event is CartInsertItem){
      repository.addItem(event.item);
    }
    if(event is CartRemoveItem){
      repository.removeItem(event.itemId);
    }
    if(event is CartRemoteUpdate){
      event.items.removeWhere((key, value) => value.quantity<=0);
      yield CartLoaded(event.items);
    }
    if(event is CartChangeItemAmount){
      repository.updateItemCount(event.itemId, event.amount);
    }
  }
}
