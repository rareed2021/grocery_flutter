part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {
  List<Category> get items => [];
}

class CategoriesInitial extends CategoriesState {}
class CategoriesLoading extends CategoriesState {}
class CategoriesLoaded extends CategoriesState{
  final List<Category> _items;
  CategoriesLoaded(this._items);
  @override
  List<Category> get items => _items;
  @override
  String toString() {
    return "CategoriesLoaded ${_items.length}";
  }
}
class CategoriesError extends CategoriesState{
  final String msg;
  CategoriesError(this.msg);
  @override
  String toString() {
    return "CategoriesError: $msg";
  }
}
