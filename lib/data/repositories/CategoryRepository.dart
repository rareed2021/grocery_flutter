

import 'package:grocery_flutter/data/models/category_response.dart';
import 'package:grocery_flutter/data/models/product_response.dart';
import 'package:grocery_flutter/data/models/subcategory_response.dart';
import 'package:grocery_flutter/data/network/groceryApi.dart';

class CategoryRepository{
  final api = GroceryApi();

  Future<List<Category>> getCategories()async{
    final response = await  api.getCategories();
    return response.data;
  }
  Future<List<SubCategory>> getSubcats(int catid) async{
    final response = await api.getSubcats(catid);
    return response.data;
  }

  Future<List<Product>> getProductsFromSubcategory(int subcatId) async {
    final response = await api.getProductsFromSubcategory(subcatId);
    return response.data;
  }
}