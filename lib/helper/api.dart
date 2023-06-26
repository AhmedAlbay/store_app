import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("there is a problem to a status  ${response.statusCode}");
    }
  }

  Future<dynamic> post(
      {required url, @required dynamic body, @required String? Token}) async {
    Map<String, String> headers = {};
    if (Token != null) {
      headers.addAll({'Authorization': 'Bearer $Token'});
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 20) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          "there is a problem to a status  ${response.statusCode}+ there is a problem to jsondecode ${response.body}");
    }
  }

  Future<dynamic> put(
      {required url, @required dynamic body, @required String? Token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (Token != null) {
      headers.addAll({'Authorization': 'Bearer $Token'});
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode == 20) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          "there is a problem to a status  ${response.statusCode}+ there is a problem to jsondecode ${response.body}");
    }
  }
}
