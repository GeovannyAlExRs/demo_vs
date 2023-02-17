import 'package:demo_vs/src/providers/main_provider.dart';
import 'package:flutter/material.dart';

import '../utils/icon_string_util.dart';
import 'alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('* Componentes *'),
        centerTitle: true,
      ),
      body: _list(),
    );
  }

  Widget _list() {
    // print(mainProvider.option);
    // mainProvider.loadData().then((option) {print(option);});

    return FutureBuilder(
      future: mainProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _viewList(context, snapshot.data),
        );
      },
    );
  }

  List<Widget> _viewList(BuildContext context, List? data) {
    final List<Widget> option = [];
    data?.forEach((op) {
      final widgetTemp = ListTile(
        title: Text(op['texto']),
        leading: getIcon(op['icon']),
        trailing: Icon(
          Icons.keyboard_arrow_right,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.pushNamed(context, op['ruta']);

          //final route = MaterialPageRoute(builder: (context) => AlertPage());
          //Navigator.push(context, route);
        },
      );
      option
        ..add(widgetTemp)
        ..add(Divider());
    });
    return option;
  }

  /*List<Widget> _viewList(List<dynamic> data) {
    final List<Widget> option = [];
    data.forEach((op) {
      //final widgetTemp = ListTile()
    });
    return [
      ListTile(title: Text('OPCION 1')),
      Divider(),
      ListTile(title: Text('OPCION 2')),
      Divider(),
      ListTile(title: Text('OPCION 3')),
      Divider(),
      ListTile(title: Text('OPCION 4')),
      Divider(),
    ];
  }*/
}
