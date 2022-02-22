import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class IHttpService {
  Future<dynamic> get(String url);
}

class HTTPConnection extends IHttpService {
  @override
  Future<dynamic> get(url) async {
    Uri uriString = Uri.parse(Uri.encodeFull(url));
    return jsonDecode((await http.get(uriString)).body);
  }
}

class DIOConnection extends IHttpService {
  final dio = Dio();

  @override
  Future<dynamic> get(url) async => (await dio.get(url)).data;
}
