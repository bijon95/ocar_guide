import 'dart:async';
import 'dart:convert';
import 'webview_controller.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ListCatDetails extends StatefulWidget {
  var title;
  var id;
  ListCatDetails(this.title, this.id);
  @override
  HomePageState createState() => new HomePageState(title, id);
}

class HomePageState extends State<ListCatDetails> {
var title;
var id;
HomePageState(this.title,this.id);
  List data;



  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://www.ocar.biz/guide/api/post_title.php?cat="+id),
        headers: {
          "Accept": "application/json"
        }
    );

    this.setState(() {
      //data = JSON.decode(response.body);
      data = json.decode(response.body);

    });

    print(data[1]["title"]);

    return "Success!";
  }

  @override
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text(this.title), backgroundColor: Colors.blue),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
              child: InkWell(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                WebViewContainer(data[index]["id"],data[index]["title"])));
                  },
                  child: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex:6,
                          child: Container(
                            child: Center(
                                child: Text(data[index]["title"],style: new TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Center(
                              child: Text(">",style: new TextStyle(fontSize: 18),),
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
              ),


          );
        },
      ),
    );
  }
}