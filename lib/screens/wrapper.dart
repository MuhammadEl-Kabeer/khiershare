import 'package:finalproject/models/user.dart';
import 'package:finalproject/screens/authenticate/authenticate.dart';
import 'package:finalproject/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<User>(context);
    print(user);
    // return either the home screen or authenticate 
    if (user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
