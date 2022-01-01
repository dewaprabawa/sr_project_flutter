import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sr_project_flutter/app/features/auth/data/models/app_user.dart';
import 'dart:developer';
import '../exception/exception.dart';

enum RequestType {
  post,
  get,
}

class NtRequest {
  static const STATUS_OK = 200;
  static const STATUS_CREATED = 201;

  final Map<String, String> _header = {'content-type': 'application/json'};

  final http.Client client;
  final String url;
  final Map<String, dynamic>? body;
  final RequestType type;
  Map<String, String>? headers;

  NtRequest(this.client, this.url, this.body, this.headers, this.type);

  Future<http.Response> getRequest() async {
    if (body != null) {
      log(body.toString());
    }

    http.Response response;
    headers ??= _header;

    try {
      switch (type) {
        case RequestType.post:
          response = await client.post(Uri.parse(url),
              headers: headers, body: jsonEncode(body));
          break;
        case RequestType.get:
          response = await client.get(Uri.parse(url), headers: headers);
          break;
      }

      if (response.statusCode != STATUS_OK) {
        throw HttpRequestException();
      }

      return response;
    } catch (exception) {
      if (exception is HttpRequestException) {
        rethrow;
      } else {
        throw RemoteServerException();
      }
    }
  }
}
