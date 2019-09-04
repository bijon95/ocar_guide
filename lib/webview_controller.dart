import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
class WebViewContainer extends StatefulWidget {
 var _id;
 var title;
  WebViewContainer(this._id,this.title);

  @override
  createState() => _WebViewContainerState(_id,title);
}
class _WebViewContainerState extends State<WebViewContainer> {
  //var _url;
  var _id;
  var title;
  _WebViewContainerState(this._id,this.title);

  final _key = UniqueKey();
 // _WebViewContainerState(this._url);
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(title: new Text(this.title), backgroundColor: Colors.blue),
        url: "https://www.ocar.biz/guide/post/view/"+_id,);
  }
}