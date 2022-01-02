import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:sr_project_flutter/app/features/auth/data/models/app_user.dart';
import 'package:sr_project_flutter/app/shared/exception/exception.dart';
import 'package:sr_project_flutter/app/shared/network/nt_request.dart';

abstract class RemoteUserDataSource {
  Future<AppUser> registerUser(AppUser user);
  Future<AppUser> login(String username, String password);
  Future<AppUser> getUser();
}

class RemoteUserDataSourceImpl implements RemoteUserDataSource {
  final http.Client client;

  const RemoteUserDataSourceImpl(this.client);

  @override
  Future<AppUser> login(String username, String password) async {
    final _url = Uri.parse("http://127.0.0.1:8080/api/auth/signIn");
    log(_url.toString());
    try {
      final _body = jsonEncode({"username": username, "password": password});
      log(_body.toString());
      var _headers = {'content-type': 'application/json'};
      _headers["Authorization"] = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJtb2RlcmF0b3IiLCJpYXQiOjE2Mzg4OTEzMzcsImV4cCI6MTYzODk3NzczN30.vKpch9U7u98UAVVli_7sjYf2AEw4tvqp8q5m3fyqZp9xBVThLVuYqRn3cU4zrzWoq_JiNrUXNJ7gay9VY-E84Q";
      final _response = await client.post(_url, body: _body, headers: _headers);
      log(_response.body);
      if (_response.statusCode != 200) {
        final message = jsonDecode(_response.body)["message"];
        throw HttpRequestException(message: message);
      }
      final decodedResponse = jsonDecode(_response.body);
      log(decodedResponse.toString());
      return AppUser.fromJson(decodedResponse);
    } catch (e) {
      throw RemoteServerException(message: e.toString());
    }
  }

  @override
  Future<AppUser> registerUser(AppUser user) async {
    final _url = Uri.parse("http://127.0.0.1:8080/api/auth/signUp");
    try {
      final _body = jsonEncode(user.toJson());
      final response = await client.post(_url, body: _body);
      if (response.statusCode != 200) {
        final message = jsonDecode(response.body)["message"];
        throw HttpRequestException(message: message);
      }
      final decodedResponse = jsonDecode(response.body);
      return AppUser.fromJson(decodedResponse);
    } catch (e) {
      throw RemoteServerException(message: e.toString());
    }
  }

  @override
  Future<AppUser> getUser() async {
    final _url = Uri.parse("http://127.0.0.1:8080/api/user");
    try {
      final response = await client.get(_url);
      if (response.statusCode != 200) {
        final message = jsonDecode(response.body)["message"];
        throw HttpRequestException(message: message);
      }
      final decodedResponse = jsonDecode(response.body);
      return AppUser.fromJson(decodedResponse);
    } catch (e) {
      throw RemoteServerException(message: e.toString());
    }
  }
}
