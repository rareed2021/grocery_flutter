part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  Map<String, CartItem> get items => {};

  double get subtotal => 0.0;

  double get total => 0.0;
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final Map<String, CartItem> _items;

  Iterable<Object> _getProps() sync* {
    var iter = _items.entries.iterator;
    while (iter.moveNext()) {
      yield iter.current.value.id;
      yield iter.current.value.quantity;
    }
  }

  @override
  Map<String, CartItem> get items => _items;

  @override
  double get subtotal => _items.values.fold(
      0.0,
      (previousValue, element) =>
          previousValue + element.quantity * element.mrp);

  @override
  double get total => _items.values.fold(
      0.0,
      (previousValue, element) =>
          previousValue + element.quantity * element.price);

  @override
  List<Object> get props => _getProps().toList();

  CartLoaded(this._items);
}
