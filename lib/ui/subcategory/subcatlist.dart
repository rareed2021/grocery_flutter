import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_flutter/data/models/subcategory_response.dart';
import 'package:grocery_flutter/data/repositories/CategoryRepository.dart';
import 'package:grocery_flutter/ui/cart/cart_icon.dart';
import 'package:grocery_flutter/ui/subcategory/productlist.dart';
import 'package:grocery_flutter/ui/subcategory/subcatlist__cubit.dart';



class CategoryListing extends StatelessWidget {
  static const String route = "/category";
  @override
  Widget build(BuildContext context) {
    final int catid = ModalRoute.of(context).settings.arguments;
    final bloc = SubcatlistCubit(catid, CategoryRepository());
    bloc.fetchData();
    return BlocProvider(create: (context)=>bloc,
        child:SubcatTabs()
    );
  }
}



class SubcatTabs extends StatefulWidget {
  @override
  _SubcatTabsState createState() => _SubcatTabsState();
}

class _SubcatTabsState extends State<SubcatTabs> {
  List<SubCategory> _mData=[];
  @override
  void initState() {
    super.initState();
    final SubcatlistCubit bloc = BlocProvider.of(context);
    final state = bloc.state;
    if(state is SubcatlistLoaded) {
      _mData = state.subcats;
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<SubcatlistCubit, SubcatlistState>(listener: (context,state){
      if(state is SubcatlistLoaded){
        setState(() {
          _mData = state.subcats;
        });
      }
    },
    child:DefaultTabController(length: _mData.length, child:
    Scaffold(
      appBar: AppBar(
        actions: [CartIcon()],
      bottom:TabBar(
        tabs:_mData.map((e) => Tab(text:e.subName)).toList()
      )
      ),
      body:TabBarView(
        children:_mData.map((e) => ProductList(e.subId)).toList()
      )
    )
    ));
  }
}
