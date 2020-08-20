import 'package:basicapp/Categoryscreen.dart';
import 'package:basicapp/FavouritesSettings.dart';
import 'package:basicapp/Web.dart';
import 'package:basicapp/homepage.dart';
import 'package:basicapp/modules/nav_module.dart';
import 'package:flutter/material.dart';

class mydrawer extends StatefulWidget {
  @override
  _mydrawerState createState() => _mydrawerState();
}

class _mydrawerState extends State<mydrawer> {
  List<nav_module> module = [
    nav_module("Headline News", ""),
    nav_module("Sports", "&category=sports"),
    nav_module("Health","&category=health",),
    nav_module("Scince","&category=science"),
    nav_module("Entertainment","&category=entertainment"),
    nav_module("Technology","&category=technology"),
    nav_module("Business","&category=business")
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, postion) {
                return ListTile(
                  leading: (module[postion].title=="Headline News")?Icon(Icons.home,color: Colors.black,):Icon(Icons.ac_unit),
                  title: Text(

                    module[postion].title,
                    style: TextStyle(fontSize: 18,color:(module[postion].title=="Headline News")?Colors.black:Colors.grey.shade800 ),
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.pop(context);
                    if (module[postion].title=="Headline News")
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>homepage()));
                    else
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Category(module[postion].title,module[postion].root)));

                  },
                );
              },
              itemCount: module.length,
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 20, right: 25),
            child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>FavouritesSettings()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(children: <Widget>[
                    Icon(Icons.settings),
                    SizedBox(width: 25,),
                    Text("Favourites Settings",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),),
                  ],),

                  Icon(Icons.chevron_right)

                ],

              ),
            ),
          )
        ],
      ),
    );
  }
}
