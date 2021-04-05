import 'package:bloc/bloc.dart';
import 'package:grocery_flutter/data/models/product_response.dart';
import 'package:grocery_flutter/data/repositories/CategoryRepository.dart';
import 'package:meta/meta.dart';

part 'subcategory_state.dart';

class SubcategoryCubit extends Cubit<SubcategoryState> {
  final int _subcatId;
  final CategoryRepository repository;
  SubcategoryCubit(this._subcatId, this.repository):super(SubcategoryInitial());

  void fetchData(){
    emit(SubcategoryLoading());
    print("Getting product data");
    repository.getProductsFromSubcategory(_subcatId)
    .then((value) => emit(SubcategoryLoaded(value)),
      onError: (error)=>emit(SubcategoryError(error.toString()))
    );
  }
}
