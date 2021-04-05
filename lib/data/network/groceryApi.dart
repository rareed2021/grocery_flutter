import 'dart:convert';
import 'package:grocery_flutter/data/models/category_response.dart';
import 'package:grocery_flutter/data/models/product_response.dart';
import 'package:grocery_flutter/data/models/subcategory_response.dart';
import 'package:grocery_flutter/data/network/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:grocery_flutter/data/models/auth_response.dart';
import 'dart:async';

import 'package:http/http.dart';

class GroceryApi{
  T _handleResponse<T>(Response response, T Function(Map<String,dynamic>) build) {
    print("Reached");
    if (response.statusCode == 200) {
      print("Trying to decode");
      print("${response.body}");
      final ret = build(jsonDecode(response.body));
      print("success: $ret");
      return ret;
    } else {
        final msg = jsonDecode(response.body)['message'];
        print("error msg: $msg");
        if(msg!=null) {
          print("error (msg): $msg");
          throw Exception(msg.message);
        }else {
          print("error: ${response}");
          throw Exception(response.body ?? "Network Error");
        }
    }
  }

  Future<AuthResponse> login(email,password) async{
    final body =  jsonEncode(User(email: email, password: password).toJson());
    final response = await http.post(Endpoints.login, body:body,headers:{"Content-Type": "application/json" });
    print(response.body);
    return _handleResponse(response, (json)=>AuthResponse.fromJson(json));
    if(response.statusCode==200){
      return AuthResponse.fromJson(jsonDecode(response.body));
    }else{
      try {
        final msg = AuthResponse.fromJson(jsonDecode(response.body));
        throw Exception(msg.message);
      }catch (e){
        throw Exception(response.body);
    }
    }
  }


  Future<AuthResponse> register(email,password,name,phone) async{
    final body =  jsonEncode(User(email: email, password: password, mobile:phone,firstName:name).toJson());
    final response = await http.post(Endpoints.login, body:body,headers:{"Content-Type": "application/json" });
    return _handleResponse(response, (json) => AuthResponse.fromJson(json));
    // if(response.statusCode==200){
    //   return AuthResponse.fromJson(jsonDecode(response.body));
    // }else{
    //   try {
    //     final msg = AuthResponse.fromJson(jsonDecode(response.body));
    //     throw Exception(msg.message);
    //   }catch (e){
    //     throw Exception("Network error");
    //   }
    // }
  }

  Future<CategoryResponse> getCategories() async{
    final response = await http.get(Endpoints.categories);
    return _handleResponse(response, (json) => CategoryResponse.fromJson(json));
    // if(response.statusCode == 200){
    //   return CategoryResponse.fromJson(jsonDecode(response.body));
    // }
  }

  Future<SubcategoryResponse> getSubcats(int catid) async{
    final response = await http.get(Endpoints.subcatFromCat(catid));
    return _handleResponse(response, (json) => SubcategoryResponse.fromJson(json));
  }

  Future<ProductResponse> getProductsFromSubcategory(int subcatId) async {
    print("Address: ${Endpoints.productsFromSubcat(subcatId)}");
    final response = await http.get(Endpoints.productsFromSubcat(subcatId));
    return _handleResponse(response, (json) => ProductResponse.fromJson(json));
  }
}