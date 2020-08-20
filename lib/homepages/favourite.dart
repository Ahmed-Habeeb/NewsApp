import 'package:basicapp/api/fetchdata.dart';
import 'package:basicapp/modules/article.dart';
import 'package:basicapp/modules/nav_module.dart';
import 'package:basicapp/utilitis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Web.dart';

class favourite extends StatefulWidget {
  @override
  _favouriteState createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  fetchdata data=fetchdata();
  List<nav_module> module = [
    nav_module("Sports", "&category=sports"),
    nav_module(
      "Health",
      "&category=health",
    ),
    nav_module("Scince", "&category=science"),
    nav_module("Entertainment", "&category=entertainment"),
    nav_module("Technology", "&category=technology"),
    nav_module("Business", "&category=business")
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loop2(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.active)
          return loading();
        else if (snapshot.connectionState == ConnectionState.waiting)
          return loading();
        else if (snapshot.connectionState == ConnectionState.none)
          return loading();
        else if (snapshot.connectionState == ConnectionState.done) {
          return FutureBuilder(
            future: getrequest(snapshot.data),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.active)
                return loading();
              else if (snapshot.connectionState == ConnectionState.waiting)
                return loading();
              else if (snapshot.connectionState == ConnectionState.none)
                return loading();
              else if (snapshot.connectionState == ConnectionState.done) {
                List<Article> articales = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, postion) {
                    return  GestureDetector(
                        onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Web(articales[postion].url))),
                        child: drawcard(articales[postion]));
                  },
                  itemCount: articales.length,
                );
              }
              return null;
            }
          );
        }
        return null;
      }

    );
  }

  Future<List<String>> loop2() async {
    List<String> FavouriteCategories = List<String>();
    var prf = await SharedPreferences.getInstance();
    for (var item in module) {
      if ((await getshared(item.title)) == true) {
        FavouriteCategories.add(item.root);
      }
    }

    return FavouriteCategories;
  }
  listview1(){

  }
 Future<List<Article>> getrequest(List<String> list)async{
    List<Article> Articales=List<Article>();
    for (var i in list){
     List<Article> art=await data.fetchcategory(i);
     for(var articale in art){
       Articales.add(articale);
     }
    }
    return Articales;
  }

}
