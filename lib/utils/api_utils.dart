import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:milky_way/utils/uihelper.dart';

class ApiClient {
  late http.Client? client;
  late String? accessToken;
  String baseUrl = "";

  final bool showError;

  ApiClient({
    http.Client? client,
    accessToken = "",
    this.showError: true,
  }) : client = client ?? http.Client();

  Future<dynamic> get(String url, {Map<String, dynamic>? queries}) async {
    debugPrint("Url: $url");

    var responseJson;
    try {
      final response = await client!.get(Uri.parse(baseUrl + url), headers: {
        'Content-type': 'application/json',
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url, {Map<String, dynamic>? queries}) async {
    debugPrint("Url: $url");

    var responseJson;
    try {
      final response = await client!.delete(Uri.parse(baseUrl + url), headers: {
        'Content-type': 'application/json',
        'x-auth-token': '$accessToken',
        'x-api-key': 'd585777c-d9a3-11eb-b8bc-0242ac130003'
      });
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? data}) async {
    print(baseUrl + url);
    var responseJson;
    try {
      final response = await client!.post(Uri.parse(baseUrl + url),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            'x-auth-token': '$accessToken',
            'x-api-key': 'd585777c-d9a3-11eb-b8bc-0242ac130003'
          },
          body: json.encode(data));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> put(String url, {Map<String, dynamic>? data}) async {
    var responseJson;
    try {
      final response = await client!.patch(Uri.parse(baseUrl + url),
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
          body: json.encode(data));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future upload(File file, String use) async {
    final request = http.MultipartRequest('POST', Uri.parse('$baseUrl/upload'));

    request.files.add(
      http.MultipartFile.fromBytes(
        'file',
        file.readAsBytesSync(),
        filename: file.path.split('/').last,
      ),
    );
    request.fields.addAll({
      'file_use': use,
    });

    request.headers.addAll({
      'x-auth-token': '$accessToken',
      'x-api-key': 'd585777c-d9a3-11eb-b8bc-0242ac130003'
    });

    final res = await client!.send(request);
    return _returnResponse(await http.Response.fromStream(res));
  }

  dynamic _returnResponse(http.Response response) {
    try {
      return _getResponse(response);
    } on AppException catch (e) {
      if (showError) {
        UIHelper.error(e._message);
      }
      throw e;
    }
  }

  dynamic _getResponse(http.Response response) {
    int code = response.statusCode;
    if (response.body.startsWith('{"status":"error"')) {
      // handle v1 fake 200 errors
      if (response.statusCode != 401) code = 400;
    }
    switch (code) {
      case 400:
        print('badddd');
        throw BadRequestException(
            json.decode(response.body.toString())['message']);
      case 401:
        //  AuthService.it.logout();
        throw InvalidTokenException(json.decode(response.body)['message']);
      case 403:
        throw UnauthorisedException(json.decode(response.body)['message']);
      case 500:
      default:
        if (!isResponseOk(response.statusCode)) {
          throw FetchDataException('\n StatusCode : ${response.statusCode}.'
              '\n Response: ${response.body.toString()}');
        }
        var responseJson = json.decode(response.body.toString());
        return responseJson;
    }
  }

  bool isResponseOk(int statusCode) {
    return statusCode >= 200 && statusCode <= 299;
  }
}

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidTokenException extends AppException {
  InvalidTokenException([message]) : super(message, "Invalid Token: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
