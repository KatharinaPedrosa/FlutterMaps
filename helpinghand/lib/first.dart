import 'dart:ui';
import 'package:flutter/material.dart';
import 'second.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/logo.png",
              fit: BoxFit.contain,
              height: 35.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text("Helping Hand")
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        backgroundColor: Color.fromRGBO(21, 182, 214, 1),
        centerTitle: true,
      ),
      body: Container(
          color: Color.fromRGBO(21, 182, 214, 1),
          child: Padding(
            padding: EdgeInsets.only(top: 100.0),
            child: Center(
                child: Column(children: [
              Text(
                "Escolha\numa loja\nno mapa",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              SizedBox(height: 150.0),
              SizedBox(
                width: 60,
                height: 60,
                child: FlatButton(
                  child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                  color: Color.fromRGBO(231, 37, 83, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SecondPage()));
                  },
                ),
              )
            ])),
          )),
    );
  }
}
