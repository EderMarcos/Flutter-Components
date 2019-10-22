import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  _MenuProvider() { }

  Future<List<dynamic>> initData() async {
    final data = await rootBundle.loadString('data/options.json');
    Map dataToMap = json.decode(data);
    return dataToMap['routes'];
  }
}

final menuProvider = new _MenuProvider();
