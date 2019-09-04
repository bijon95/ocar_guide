import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'model.dart';
import 'title_list.dart';


class CountyGridView extends StatelessWidget {
  final List<Country> country;
  double high_listview = 40;
  //BuildContext context;

  List<String> _listViewData = [
    "English",
    "Bangla",
    "Malay",
  ];





  CountyGridView({Key key, this.country}) : super(key: key);

  getStructuredGridCell(Country country, BuildContext context) {
    return new Card(
      color: Colors.white,
      elevation: 2,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ListCatDetails(country.name,country.id)));
        },
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          verticalDirection: VerticalDirection.down,
          children: <Widget>[
            new Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
            new Center(
              child: FadeInImage(
                image: NetworkImage(
                  "http://www.ocar.biz/guide/uploads/category/"+country.flag,
                ),
                height: 50,
                width: 50,
                placeholder: AssetImage('images/loading.gif'),
              ),
            ),
            new Center(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    country.name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  double hight_bg = 100;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              height: 220,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new ExactAssetImage('images/bgdashboard.jpg'),
                      fit: BoxFit.cover)),
            ),
            Container(
              height: (MediaQuery.of(context).size.height - 220),
               color: Color.fromRGBO(242, 242, 242, 2),
             // color: Colors.grey,
            ),
          ],
        ),
        SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    child: new InkWell(
                      onTap: () {
                        _displayDialog(context);
                      },

                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.fromLTRB(0, 30, 25, 0),
                        child: Text('EN', style: TextStyle(
                            fontSize: 24,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                          textAlign: TextAlign.right,
                        ),
                      ),
                   ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      child: new Image.asset(
                        'images/logodashboard.png',
                        height: 80,
                        width: 180,
                      )),
                  Container(
                    child: Text(
                      'oCar User Guide',
                      style: TextStyle(
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: (hight_bg * country.length),
                    child: new GridView.count(
                      physics: FixedExtentScrollPhysics(),
                      shrinkWrap: false,
                      primary: true,
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                      crossAxisCount: 2,
                      childAspectRatio: 1.20, //card side hight weight ratio
                      mainAxisSpacing: 32.0, //space from two card
                      crossAxisSpacing: 32.0, // space from two card
                      children: List.generate(country.length, (index) {
                        this.hight_bg = index.toDouble();

                        return getStructuredGridCell(country[index], context);
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Choose Language'),
            content: Container(
              width: double.maxFinite,
              height: 200,
              child: ListView.builder(itemBuilder: (BuildContext contex, int index){
                var language = _listViewData[index];

                return ListTile(
                  title: Text(language),
                  onTap: (){

                  },

                );


              },
                itemCount: _listViewData.length,
              )
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
