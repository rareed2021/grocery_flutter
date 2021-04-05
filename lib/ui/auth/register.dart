import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_flutter/data/repositories/AuthRepository.dart';
import 'package:grocery_flutter/ui/auth/bloc/auth_cubit.dart';

class Register extends StatelessWidget {
  static const route = "/register";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Register",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title:Text("Register")),
            body:Container(
              padding: EdgeInsets.all(40),
              child: BlocProvider(
                create: (BuildContext context) {
                  return AuthCubit(AuthRepository());
                },
                child: BlocListener<AuthCubit,AuthState>(
                  listener: (context, state) {
                    print(state);
                  },
                  child: _RegisterInputs(),
                ),
              ),
            )));
  }
}


class _RegisterInputs extends StatelessWidget {
  InputDecoration _inputDec(String field)=>InputDecoration(
    border: const OutlineInputBorder(),
    labelText: field,
    hintText: field,
  );

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    final password = TextEditingController();
    final name = TextEditingController();
    final phone = TextEditingController();
    final AuthCubit bloc = BlocProvider.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: email,
          decoration: _inputDec("Email"),
        ),
        TextField(
          controller: name,
          decoration: _inputDec("Name"),
        ),
        TextField(
          controller: phone,
          decoration: _inputDec("Phone Number"),
        ),
        TextField(
          controller: password,
          obscureText: true,
          decoration: _inputDec("Password"),
        ),
        ElevatedButton(onPressed: (){
          bloc.registerUser(email.text, password.text, name.text, phone.text);
          Navigator.pop(context);
          Navigator.pop(context);
        }, child: Text("Register"))
      ],
    );
  }
}
