import 'package:flutter/material.dart';

class HomePagesTemp extends StatelessWidget {
  final option = ['UNO', 'DOS', 'TRES', 'CUATRO', 'CINCO'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Component Temp'),
      ),
      body: ListView(children: _viewItems2()),
    );
  }

  List<Widget> _viewItems() {
    List<Widget> list = <Widget>[];

    for (String op in option) {
      final tempWifget = ListTile(title: Text(op));

      list
        ..add(tempWifget)
        ..add(Divider());
    }
    return list;
  }

  List<Widget> _viewItems2() {
    return option.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Opcion del menu'),
            leading: Icon(Icons.verified_user),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
