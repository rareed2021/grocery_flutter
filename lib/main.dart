import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_flutter/data/repositories/AuthRepository.dart';
import 'package:grocery_flutter/data/repositories/CartRepository.dart';
import 'package:grocery_flutter/ui/auth/bloc/auth_cubit.dart';
import 'package:grocery_flutter/ui/auth/login.dart';
import 'package:grocery_flutter/ui/auth/register.dart';
import 'package:grocery_flutter/ui/cart/bloc/cart_bloc.dart';
import 'package:grocery_flutter/ui/cart/cart_list.dart';
import 'package:grocery_flutter/ui/categories/categories.dart';
import 'package:grocery_flutter/ui/subcategory/subcatlist.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Test 1");
  await Firebase.initializeApp();
  print("test");
  runApp(GroceryApp());
}

class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
              create: (context) => AuthCubit(AuthRepository())),
          BlocProvider<CartBloc>(create: (context) {
            print("Creating cart bloc");
            return CartBloc(CartRepository());
          })
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              CheckoutPage.route: (context) => CheckoutPage(),
              Register.route: (context) => Register(),
              LoginWidget.route: (context) => LoginWidget(),
              CategoryPage.route: (context) => CategoryPage(),
              CategoryListing.route: (context) => CategoryListing()
            },
            home: CategoryPage()
            // initialRoute: "/categories",
            // home:LoginWidget()
            ));
  }
}
