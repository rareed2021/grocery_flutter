import 'package:bloc/bloc.dart';
import 'package:grocery_flutter/data/models/category_response.dart';
import 'package:grocery_flutter/data/repositories/CategoryRepository.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryRepository repository;

  CategoriesCubit(this.repository) : super(CategoriesInitial());

  void fetchData(){
    emit(CategoriesLoading());
    print("Loading");
    repository.getCategories().then((values) {
      print("got vals");
      emit(CategoriesLoaded(values));
    }).onError((error, stackTrace) {
      print("error $error");
      print(stackTrace);
      emit(CategoriesError(error.toString()));
      return null;
    });
  }
}
