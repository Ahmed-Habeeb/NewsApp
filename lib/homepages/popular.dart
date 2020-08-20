import 'package:basicapp/api/fetchdata.dart';
import 'package:basicapp/modules/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utilitis.dart';


import '../Web.dart';

class popular extends StatefulWidget {
  @override
  _popularState createState() => _popularState();
}

class _popularState extends State<popular> {
  fetchdata data=fetchdata();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: data.fetchheadlinesdata(),
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
    );
  }

}
