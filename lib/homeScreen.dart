import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'model.dart';
import 'gridview.dart';
import 'netwoklayer.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("",
//          style: new TextStyle(
//            color: const Color(0xFFFFFFFF),
//          ),
//        ),
//      ),
      body:  futureBuilder(),


    );

  }
  Widget  futureBuilder(){
    return FutureBuilder<List<Country>>(
      future: fetchCountry(new http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);

        return snapshot.hasData
            ? new CountyGridView(country: snapshot.data)
            : new Center(child: new CircularProgressIndicator());
      },
    );
  }
}