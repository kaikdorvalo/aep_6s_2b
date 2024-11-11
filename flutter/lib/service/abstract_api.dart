import 'dart:convert';

import 'package:front/service/http_methods.dart';
import 'package:http/http.dart';

abstract class AbstractApi {
  final String urlLocalHost = "http://127.0.0.1:8000";

  String _recurso;
  HttpMethods http;

  AbstractApi(
    this._recurso,
    HttpMethods this.http,
  );

  Future<String> getAll() async {
    var response = await http.get(Uri.parse("$urlLocalHost/$_recurso"));
    final decoded = utf8.decode(response.bodyBytes);
    return decoded;
  }

  Future<Response> create(dynamic data) async {
    var response =
        await http.post(Uri.parse("$urlLocalHost/$_recurso"), jsonEncode(data));
    return response;
  }

  Future<Response> remove(String id) async {
    var response = await http.delete(Uri.parse("$urlLocalHost/$_recurso/$id"));
    return response;
  }

  Future<Response> update(String id, dynamic body) async {
    var response = await http.put(
        Uri.parse("$urlLocalHost/$_recurso/$id"), jsonEncode(body));
    return response;
  }
}
