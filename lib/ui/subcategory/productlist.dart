import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_flutter/data/models/product_response.dart';
import 'package:grocery_flutter/data/repositories/CategoryRepository.dart';
import 'package:grocery_flutter/ui/subcategory/product_row.dart';
import 'package:grocery_flutter/ui/subcategory/subcategory_cubit.dart';

class ProductList extends StatelessWidget {
  final int _subcatId;
  @override
  Widget build(BuildContext context) {
    final bloc = SubcategoryCubit(_subcatId, CategoryRepository());
    bloc.fetchData();
    return BlocProvider<SubcategoryCubit>(
      create: (context)=>bloc,
      child: _ProductList(),
    );
  }

  ProductList(this._subcatId);
}




class _ProductList extends StatefulWidget {
  @override
  __ProductListState createState() => __ProductListState();
}

class __ProductListState extends State<_ProductList> {
  List<Product> _mData = [];
  @override
  void initState() {
    super.initState();
    final SubcategoryCubit bloc = BlocProvider.of(context);
    final state = bloc.state;
    print("Initial state $state");
    if(state is SubcategoryLoaded){
      _mData = state.products;
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<SubcategoryCubit, SubcategoryState>(
      listener: (context,state){
        print("State change $state");
        if(state is SubcategoryLoaded){
          print("New data arrived ${state.products?.length}");
          setState(() {
            if(state.products!=null) {
              _mData = state.products;
            }
          });
        }
      },
      child:ListView(
        children: _mData.map((e) => ProductRow(e)).toList(),
      )
    );
  }
}



