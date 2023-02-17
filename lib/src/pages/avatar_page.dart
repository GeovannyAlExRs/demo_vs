import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final url =
        'https://assets.turbologo.com/blog/es/2019/10/19133015/spiderman-logo-illustration-958x575.jpg';
    final url2 = 'https://wallpaperstock.net/wallpapers/thumbs1/56799wide.jpg';
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(url),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0, left: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.redAccent,
            ),
          )
        ],
      ),
      body: Center(
          child: FadeInImage(
        placeholder: AssetImage('assets/loading.gif'),
        image: NetworkImage(url2),
        fadeInDuration: Duration(milliseconds: 200),
        height: 250.0,
        fit: BoxFit.cover,
      )),
    );
  }
}
