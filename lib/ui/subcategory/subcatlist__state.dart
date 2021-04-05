part of 'subcatlist__cubit.dart';

@immutable
abstract class SubcatlistState {}

class SubcatlistInitial extends SubcatlistState {}
class SubcatlistLoading extends SubcatlistState {}
class SubcatlistLoaded extends SubcatlistState {
  final List<SubCategory> subcats;
  SubcatlistLoaded(this.subcats);
}
class SubcatlistError extends SubcatlistState{
  final String msg;
  SubcatlistError(this.msg);
}
