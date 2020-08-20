import 'package:basicapp/homepages/favourite.dart';
import 'package:basicapp/homepages/popular.dart';
import 'package:basicapp/homepages/whtsnew.dart';
import 'package:basicapp/mydrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}
enum pop{About,Setting,Logout}


// ignore: camel_case_types
class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HeadLines"),
        centerTitle: false,

        bottom: TabBar(

          indicatorColor: Colors.white,
          indicatorPadding: EdgeInsets.all(-2),
          tabs: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("WHATS NEW"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text("POPULAR"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:10),
              child: Text("FAVOURITES"),
            ),
          ],
          controller: _tabController,
        ),
      ),
      drawer: mydrawer(),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          whatsnew(),
          popular(),
          favourite()
        ],
      ),
    );
  }
  Widget popup(BuildContext context){
    return PopupMenuButton<pop>(
      icon: Icon(Icons.more_vert),
      itemBuilder: (context){
        return [ PopupMenuItem<pop>(
          child:Text("About") ,
          value: pop.About,
        ),
          PopupMenuItem<pop>(
            child:Text("Logout") ,
            value: pop.Logout,
          ),PopupMenuItem<pop>(
            child:Text("Setting") ,
            value: pop.Setting,
          ),
        ];


      },onSelected: (pop p){},


    );
  }
}
