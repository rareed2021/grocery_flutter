part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}
class CartInsertItem  extends CartEvent {
  final CartItem item;
  CartInsertItem(this.item);
  @override
  List<Object> get props => [item.id];
}
class CartRemoveItem extends CartEvent{
  final String itemId;

  CartRemoveItem(this.itemId);

  @override
  List<Object> get props => [itemId];

  @override
  String toString() {
    return 'CartRemoveItem{itemId: $itemId}';
  }
}

class CartChangeItemAmount extends CartEvent{
  final String itemId;
  final int amount;

  CartChangeItemAmount(this.itemId, this.amount);

  @override
  List<Object> get props =>[itemId,amount];

  @override
  String toString() {
    return 'CartChangeItemAmount{itemId: $itemId, amount: $amount}';
  }
}

class CartRemoteUpdate extends CartEvent{
  final Map<String,CartItem> items;

  CartRemoteUpdate(this.items);

  Iterable<Object> _getProps() sync*{
    for(var i=0;i<items.length;i++){
      yield items[i].id;
      yield items[i].quantity;
    }
  }

  @override
  List<Object> get props => _getProps().toList();
}


