import 'package:basicapp/utilitis.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class FavouritesSettings extends StatefulWidget {
  @override
  _FavouritesSettingsState createState() => _FavouritesSettingsState();
}

class _FavouritesSettingsState extends State<FavouritesSettings> {
  List<Categorymdoule> list = [
    Categorymdoule("Sports", false),
    Categorymdoule("Health", false),
    Categorymdoule("Science", false),
    Categorymdoule("Entertainment", false),
    Categorymdoule("Technology", false),
    Categorymdoule("Business", false),
  ];


  @override
  Widget build(BuildContext context) {
    loop();


    return Material(
      child: ListView.builder(
        itemBuilder: (context, postion) {
          bool value5;
          //getshared(list[postion].Title);
          return FutureBuilder(
            future: getshared(list[postion].Title),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return drawcategoryradio(
                  list[postion].Title, snapshot.data, postion);
            },
          );
        },
        itemCount: list.length,
      ),
    );
  }

  Widget drawcategoryradio(String title, bool value, int pos) {
    return CheckboxListTile(
      onChanged: (vl) {
        setState(() {
          onchangev(vl, title);
        });
      },
      value: (value == null) ? false : value,
      title: Text(title),
      activeColor: Colors.red,
    );
  }

  onchangev(bool v, String postion) {
    setshared(postion, v);
  }





  loop() async {
    for (var item in list) {
      if ((await getshared(item.Title)) == null) {
        setshared(item.Title, item.value);
      }
    }
  }


}
class Categorymdoule {
  String Title;
  bool value;

  Categorymdoule(this.Title, this.value);
}
