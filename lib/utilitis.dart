import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'modules/article.dart';
String baseimg="https://media4.s-nbcnews.com/i/newscms/2019_01/2705191/nbc-social-default_b6fa4fef0d31ca7e8bc7ff6d117ca9f4.png";
String diffrencetime(var date1){
  var date2=DateTime.parse(date1);
  var formt=DateFormat('Hh-mm');
  var date=DateTime.now();
  var diff=date.difference(date2).inHours;
  var data=formt.format(date2);
  return diff.toString()+" Hours";

}
Widget drawcard(Article article) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          SizedBox(
            child: Container(
              width: 100,
              height: 100,
              child: Image(image: NetworkImage((article.imageurl!=null)?article.imageurl:baseimg),fit: BoxFit.cover,),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  article.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Expanded(
                      child: Text((article.author==null||article.author.contains("www"))?"News":
                      article.author,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.access_time),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(diffrencetime(article.puplishedat)),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
Widget loading(){
  return Center(
    child:Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text("Loading..."),
        )
      ],
    ),
  );
}
Future<bool> getshared(String key) async {
  var sharedPreferences = await SharedPreferences.getInstance();
  bool value = sharedPreferences.getBool(key);
  return value;
}
setshared(String key, bool value) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool(key, value);
}