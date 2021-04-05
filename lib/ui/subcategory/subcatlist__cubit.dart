import 'package:bloc/bloc.dart';
import 'package:grocery_flutter/data/models/subcategory_response.dart';
import 'package:grocery_flutter/data/repositories/CategoryRepository.dart';
import 'package:meta/meta.dart';

part 'subcatlist__state.dart';

class SubcatlistCubit extends Cubit<SubcatlistState> {
  final CategoryRepository repository;
  final int _catid;
  SubcatlistCubit(this._catid, this.repository) : super(SubcatlistInitial());

  void fetchData(){
    emit(SubcatlistLoading());
     repository.getSubcats(_catid).then( (value){
       emit(SubcatlistLoaded(value));
     }
     ).onError( (error,stackTrace){
       emit(SubcatlistError(error.toString()));
       return null;
     });
  }
}
