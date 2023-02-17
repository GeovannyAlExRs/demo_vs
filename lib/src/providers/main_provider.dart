import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MainProvider {
  List<dynamic> option = [];

  _MainProvider() {
    loadData();
  }

  Future<List<dynamic>> loadData() async {
    final request = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(request);
    option = dataMap['rutas'];

    return option;
  }
}

final mainProvider = new _MainProvider();
