import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Page')),
      body: Center(
          child: ElevatedButton(
        onPressed: () => _viewAlert(context),
        child: Text('View Alert'),
        style: ElevatedButton.styleFrom(shape: StadiumBorder()),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.keyboard_arrow_left),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _viewAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text('Alerta'),
            content: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              Text('Mostrar texto de la alerta...!!!'),
              FlutterLogo(
                size: 100.0,
              )
            ]),
            actions: <Widget>[
              TextButton(
                  child: Text('Cancelar'),
                  onPressed: () => Navigator.of(context).pop()),
              TextButton(
                  child: Text('ok'),
                  onPressed: () => Navigator.of(context).pop()),
            ],
          );
        });
  }
}
