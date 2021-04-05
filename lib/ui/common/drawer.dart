import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_flutter/ui/auth/bloc/auth_cubit.dart';
import 'package:grocery_flutter/ui/auth/login.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  User _user;
  AuthCubit _bloc;
  StreamSubscription<AuthState> _subscription;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
    _user = _bloc.state.user;
    _subscription = _bloc.stream.listen((state) {
      print("is mounted? ${this.mounted}");
      if (this.mounted) {
        setState(() {
          _user = state.user;
        });
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    AuthCubit bloc = BlocProvider.of(context);
    if (_user != null) {
      children.addAll([
        UserAccountsDrawerHeader(
            accountName: Text(_user?.displayName??""),
            accountEmail: Text(_user?.email??"")),
        ListTile(
          title: Text("Logout"),
          trailing: Icon(Icons.logout),
          onTap: () {
            bloc.logout();
          },
        )
      ]);
    } else {
      final theme = Theme.of(context);
      children.addAll([DrawerHeader(
          child: Text("Welcome Guest", style: theme.textTheme.headline4),
          decoration: BoxDecoration(color: theme.primaryColor)),
        ListTile(
          title:Text("Login"),
          trailing:Icon(Icons.login),
          onTap:(){
            Navigator.pop(context);
            Navigator.pushNamed(context, LoginWidget.route);
          }
        )
      ]);
    }
    return Drawer(
      child: ListView(
        children: children,
      ),
    );
  }
}
