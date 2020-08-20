import 'dart:math';

import 'package:basicapp/api/fetchdata.dart';
import 'package:basicapp/modules/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utilitis.dart';

class whatsnew extends StatefulWidget {
  @override
  _whatsnewState createState() => _whatsnewState();
}

class _whatsnewState extends State<whatsnew> {
  fetchdata data = fetchdata();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: data.fetchheadlinesdata(),
      builder: (context, AsyncSnapshot snapshot) {

        if (snapshot.connectionState == ConnectionState.active)
          return loading();
        else if (snapshot.connectionState == ConnectionState.waiting)
          return loading();
        else if (snapshot.connectionState == ConnectionState.none)
          return loading();
        else if (snapshot.connectionState == ConnectionState.done) {
          List<Article> articles = snapshot.data;
        int lenth=articles.length;
          int i = random(lenth);
          int topstoreis1 = random(lenth);
          int topstoreis2 = random(lenth);
          int topstoreis3= random(lenth);
          int recentupdates1 = random(lenth);
          int recentupdates2 = random(lenth);




          Article randomarticle = articles[i];
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Image(
                      image: NetworkImage((randomarticle.imageurl!=null)?randomarticle.imageurl:baseimg),
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * .35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            randomarticle.title,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Text(
                              randomarticle.description,
                              style: TextStyle(color: Colors.white, fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  color: Colors.grey.shade400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _drawtext("Top Stories"),
                      _drawcard(articles[(topstoreis1<articles.length)?topstoreis1++:topstoreis1]),
                      _drawcard(articles[(topstoreis2<articles.length)?topstoreis2++:topstoreis2]),
                      _drawcard(articles[(topstoreis3<articles.length)?topstoreis3++:topstoreis1]),
                      _drawtext("Recent Updates"),
                      _drawcard2(articles[recentupdates1]),
                      _drawcard2(articles[recentupdates2])
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _drawcard(Article article) {
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
                      Text(
                        (article.author==null||article.author.contains("www"))?"News":
                        article.author,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.access_time),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text((diffrencetime(article.puplishedat)).toString()),
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

  Widget _drawtext(String t) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 15, bottom: 8, right: 10),
      child: Text(
        t,
        style: TextStyle(color: Colors.grey.shade50, fontSize: 18),
      ),
    );
  }

  Widget _drawcard2(Article article) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .30,
              child: Container(
                child: Image(image: NetworkImage((article.imageurl!=null)?article.imageurl:baseimg),fit: BoxFit.cover,),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 40,
              bottom: 8,
            ),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 30, top: 8, right: 30, bottom: 8),
                child: Text(
                  (article.author==null||article.author.contains("www"))?"News":
                  article.author,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              color: Colors.deepOrange,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 8.0, left: 20, right: 20, bottom: 10),
            child: Text(
              article.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, left: 20, right: 20, bottom: 8),
            child: Row(
              children: <Widget>[
                Icon(Icons.access_time),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(article.puplishedat),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget loading() {
    return Center(
      child: Column(
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
  int random(int lenth){
    Random random = Random();
    int i = random.nextInt(lenth);
    return i;
  }

}
