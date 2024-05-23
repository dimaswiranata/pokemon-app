import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nexus_app/core/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

final client = Client();

class APIServices {
  late final SharedPreferences prefs;

  Future<Response> fetchData(String urlPath) async {
    prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token') ?? '';
    print(token);
    return client.dio.get(urlPath, options: Options(headers: {'Content-Type': 'application/json'}));
  }

  Future<Response> postData(String urlPath, {Map<String, dynamic>? body}) async {
    prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token') ?? '';
    print(token);
    return client.dio.post(
      urlPath,
      data: json.encode(body),
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
  }
}
