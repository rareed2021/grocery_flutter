import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_flutter/data/repositories/AuthRepository.dart';
import 'package:grocery_flutter/ui/auth/bloc/auth_cubit.dart';
import 'package:grocery_flutter/ui/auth/register.dart';
import 'package:grocery_flutter/ui/common/drawer.dart';

class LoginWidget extends StatelessWidget {
  static const route = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      drawer:AppDrawer(),
      body: Container(
        padding: EdgeInsets.all(40),
        child:
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if(state is AuthLoggedIn){
              //if we came from a page, go back there
              //otherwise
              if(Navigator.canPop(context)){
                Navigator.pop(context);
              }else{
                Navigator.pushReplacementNamed(context, Navigator.defaultRouteName);
              }
            }
            print(state);
          },
          child: LoginInputs(),
        ),
      ),
    );
  }
}

class LoginInputs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final AuthCubit bloc = BlocProvider.of(context);
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Email",
              labelText: "Email"),
        ),
        TextField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Password",
              labelText: "Password"),
        ),
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, Register.route);
          },
          child: Text("New user? register here",
            style:TextStyle(decoration: TextDecoration.underline, color: Colors.blueAccent)
          ),
        ),
        ElevatedButton(
            onPressed: () {
              bloc.loginUser(emailController.text, passwordController.text);
            },
            child: Text("Sign In"))
      ],
    );
  }
}
