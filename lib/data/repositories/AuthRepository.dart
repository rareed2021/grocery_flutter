import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:grocery_flutter/data/network/groceryApi.dart';


class AuthRepository{
  final api = GroceryApi();
  final channel =MethodChannel("com.example.grocery_flutter.shared_preferences");
  Future<User> login(email,password)  async{
    // final response = await api.login(email, password);
    // if(response.error!=true) {
    //   channel.invokeMethod("login", jsonEncode(response.user.toJson()));
    // }
    final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return cred.user;
  }
  Future<User> register(email,password,name,phone) async{
    // final response = await api.register(email, password, name, phone);
    // if(!response.error) {
    //   print("About to call login on android");
    //   channel.invokeMethod("login",jsonEncode(response.user.toJson()));
    // }
    final auth = FirebaseAuth.instance;
    final cred = await auth.createUserWithEmailAndPassword(email: email, password: password);
    cred.user.linkWithPhoneNumber(phone);
    cred.user.updateProfile(displayName: name);
    return cred.user;
  }

  void logout(){
    print("Logging out");
    channel.invokeMethod("logout");
  }


  Future<User> getUser() async{
    final u = FirebaseAuth.instance.currentUser;
    // final String user = await channel.invokeMethod("getUser");
    // if(user!=null){
    //   return User.fromJson(jsonDecode(user));
    // }else{
    //   return null;
    // }
  }

  AuthRepository(){
    Firebase.initializeApp();
  }
}