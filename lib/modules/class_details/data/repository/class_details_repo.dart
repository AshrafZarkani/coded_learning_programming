import 'dart:convert';

import 'package:flutter/services.dart';

/// interface for main api calls of class details
abstract class ClassDetailsRepository {
  static Future<Map<String, dynamic>> loadJsonData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    return data;
  }
}
