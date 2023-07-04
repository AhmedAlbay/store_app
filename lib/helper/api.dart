// ignore_for_file: avoid_print, duplicate_ignore

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  // ignore: non_constant_identifier_names
  Future<dynamic> get({required String url, @required String? Token}) async {
    http.Response response = await http.get(Uri.parse(url));
    Map<String, String> headers = {};
    if (Token != null) {
      headers.addAll({'Authorization': 'Bearer $Token'});
    }
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("there is a problem to a status  ${response.statusCode}");
    }
  }

  Future<dynamic> post(
      // ignore: non_constant_identifier_names
      {required url, @required dynamic body, @required String? Token}) async {
    Map<String, String> headers = {};
    if (Token != null) {
      headers.addAll({'Authorization': 'Bearer $Token'});
    }
    print('url = $url body = $body token = $Token ');
    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    // ignore: duplicate_ignore
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      // ignore: avoid_print
      print(data);
      return data;
    } else {
      throw Exception(
          "there is a problem to a status  ${response.statusCode}+ there is a problem to jsondecode ${response.body}");
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    // ignore: avoid_print
    print('url = $url body = $body token = $token ');
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
