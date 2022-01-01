import 'dart:async';
import 'dart:convert';
import 'dart:io';
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
    try {
      final _body = jsonEncode({"username": username, "password": password});
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
