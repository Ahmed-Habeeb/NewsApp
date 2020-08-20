import 'package:basicapp/stfpagev.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homepage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var shared=await SharedPreferences.getInstance();
  bool seen=shared.getBool("seen");
  Widget _screen=stfpagev();
  if(seen!=null&&seen==true) {
    _screen=homepage();
  }



  runApp(MyApp(_screen));
}

class MyApp extends StatelessWidget {
  Widget _screen;

  MyApp(this._screen); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red
      ),
      home: _screen,
    );

  }

}
