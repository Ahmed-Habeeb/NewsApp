import 'package:basicapp/api/fetchdata.dart';
import 'package:basicapp/mydrawer.dart';
import 'package:basicapp/utilitis.dart';
import 'package:flutter/material.dart';

import 'Web.dart';
import 'modules/article.dart';

class Category extends StatefulWidget {
  String title;
  String category;


  Category(this.title, this.category);

  @override
  _CategoryState createState() => _CategoryState(title,category);
}

class _CategoryState extends State<Category> {
  String title;
  String category;


  _CategoryState(this.title, this.category);
  fetchdata data=fetchdata();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: mydrawer(),
      appBar: AppBar(title: Text(title),),
      body:FutureBuilder(
        future: data.fetchcategory(category),
        builder:(context,AsyncSnapshot snapshot){
          if (snapshot.connectionState==ConnectionState.active)
            return loading();
          else if (snapshot.connectionState==ConnectionState.waiting)
            return loading();
          else if (snapshot.connectionState==ConnectionState.none)
            return loading();
          else if (snapshot.connectionState==ConnectionState.done) {
            List<Article> articales = snapshot.data;

            return ListView.builder(itemBuilder: (context,postion){


              return GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Web(articales[postion].url))),
                  child: drawcard(articales[postion]));
            },itemCount: articales.length,);
          }
          return null;


        } ,
      )
    );
  }

}
