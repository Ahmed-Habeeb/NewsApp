import 'package:basicapp/homepage.dart';
import 'package:basicapp/utilitis.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dots_indicator/dots_indicator.dart';



class stfpagev extends StatefulWidget {
  @override
  _stfpagevState createState() => _stfpagevState();
}

class _stfpagevState extends State<stfpagev> {
  double currentIndexPage1=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Transform.translate(
                            child: Icon(
                              Icons.ac_unit,
                              size: 100,
                              color: Colors.white,
                            ),
                            offset: Offset(0, -50),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            "Welcome!",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          "Ay Kalam Fady Ma3ool Ya 7op ElApp Noar Yaba",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },

            itemCount: 4,
            onPageChanged: (index){
              setState(() {
                currentIndexPage1=index.toDouble();
              });



            },
          ),
          Center(
            child: Transform.translate(child: inde(currentIndexPage1),offset: Offset(0,150),),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 15, right: 15),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  onPressed: () {
                    setshared("seen", true);
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return homepage();
                    }));
                  },
                  color: Colors.teal,
                  child: Text(
                    "GetStarted",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget inde(double currentIndexPage){
    return DotsIndicator(
      dotsCount: 4,
      position: currentIndexPage,
      decorator: DotsDecorator(
        color: Colors.grey,
        activeColor: Colors.redAccent,
      ),
    );
  }
}
