import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cards')),
      body: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
        _card1(),
        SizedBox(height: 10.0),
        _card2(),
        SizedBox(height: 10.0),
        _card1(),
        SizedBox(height: 10.0),
        _card2(),
      ]),
    );
  }

  Widget _card1() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Column(children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.photo_album,
            color: Colors.blue[300],
          ),
          title: Text('Titulo Cards 1'),
          subtitle: Text(
              'Descripcion de la tarjeta cards (Es el contenido de un parrafo) xD...'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(child: Text('Cancelar'), onPressed: () {}),
            TextButton(child: Text('ok'), onPressed: () {}),
          ],
        )
      ]),
    );
  }

  Widget _card2() {
    final url =
        'https://cdna.artstation.com/p/assets/images/images/045/638/174/large/clem-janssens-enviro-rocher-grenouille.jpg?1643193262';
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(url),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          Container(padding: EdgeInsets.all(10.0), child: Text('Title Image'))
        ],
      ),
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(0.0, 2.0),
          )
        ],
        //color: Colors.red[100]
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
