part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
  Map<String,CartItem> get items => {};
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}
class CartLoaded extends CartState {
  final Map<String,CartItem> _items;
  Iterable<Object> _getProps() sync*{
    var iter = _items.entries.iterator;
    while(iter.moveNext()){
      yield iter.current.value.id;
      yield iter.current.value.quantity;
    }
  }

  @override
  Map<String,CartItem> get items => _items;

  @override
  List<Object> get props => _getProps().toList();

  CartLoaded(this._items);
}