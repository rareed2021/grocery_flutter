part of 'subcategory_cubit.dart';

@immutable
abstract class SubcategoryState {}

class SubcategoryInitial extends SubcategoryState {}
class SubcategoryLoading extends SubcategoryState {}
class SubcategoryLoaded extends SubcategoryState {
  final List<Product> products;

  SubcategoryLoaded(this.products);

  @override
  String toString() {
    return 'SubcategoryLoaded{_products: ${products?.length}';
  }
}
class SubcategoryError extends SubcategoryState {
  final String msg;

  SubcategoryError(this.msg);

  @override
  String toString() {
    return 'SubcategoryError{msg: $msg}';
  }
}
