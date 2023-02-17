import 'package:flutter/material.dart';

import 'package:demo_vs/src/routes/route.dart';

import 'package:demo_vs/src/pages/alert_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DEMO',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoute(),
      onGenerateRoute: (RouteSettings settings) {
        print('RUTA LLAMADA : ${settings.name}');
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
