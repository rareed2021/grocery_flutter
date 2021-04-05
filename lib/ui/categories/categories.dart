import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_flutter/data/network/endpoints.dart';
import 'package:grocery_flutter/data/repositories/AuthRepository.dart';
import 'package:grocery_flutter/data/models/category_response.dart';
import 'package:grocery_flutter/data/repositories/CategoryRepository.dart';
import 'package:grocery_flutter/ui/auth/bloc/auth_cubit.dart';
import 'package:grocery_flutter/ui/categories/categories_cubit.dart';
import 'package:grocery_flutter/ui/common/cart_app_bar.dart';
import 'package:grocery_flutter/ui/common/drawer.dart';
import 'package:grocery_flutter/ui/subcategory/subcatlist.dart';

class CategoryPage extends StatelessWidget {
  static const route = "/categories";
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (BuildContext context) {
        return CategoriesCubit(CategoryRepository());
      })
    ], child: _PageScaffold());
  }
}

class _PageScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.autorenew),
          onPressed: () {
            BlocProvider.of<CategoriesCubit>(context).fetchData();
          },
        ),
        appBar: CartAppBar("Categories"),
        drawer: AppDrawer(),
        body: Align(alignment: Alignment.center, child: CategoryList()));
  }
}

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final List<Category> _mData = [];

  @override
  void initState() {
    super.initState();
    CategoriesCubit bloc = BlocProvider.of(context);
    bloc.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoriesCubit, CategoriesState>(
        listener: (context, state) {
          setState(() {
            _mData.clear();
            _mData.addAll(state.items);
          });
        },
        child: Container(
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(4),
            child: GridView(
              children: _mData.map((e) => CategoryItem(e)).toList(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
            )));
  }
}

class CategoryItem extends StatelessWidget {
  final Category _cat;

  CategoryItem(this._cat);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, CategoryListing.route, arguments:_cat.catId);
      },
      child: Card(
        elevation: 6,
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
        children: [
            CachedNetworkImage(imageUrl: Endpoints.imageUrl(_cat.catImage),
              fit:BoxFit.fitHeight
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  _cat.catName,
                  style: TextStyle(
                      backgroundColor: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ))
        ],
      ),
          )),
    );
  }
}
