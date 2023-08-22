import 'dart:io';
import 'package:get/get.dart';
import 'package:shop_app/core/exceptions/server_exception.dart';

abstract class ApiClient extends GetConnect implements GetxService {
  late String appBaseUrl;
  late Map<String, String> mainHeaders;
  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }

  Future<Response> getMethod(String url) async {
    try {
      Response response = await get(url);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ServerException("Error ${response.statusText}");
      }
    } on SocketException {
      throw ServerException("Connection failed");
    } on FormatException catch (e) {
      throw ServerException("Error ${e.message.toString()}");
    }
  }

  Future<Response> postMethod(String url, dynamic body) async {
    try {
      Response response = await post(url, body);
      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw ServerException("${response.body}");
      } else {
        throw ServerException("Error ${response.statusText}");
      }
    } on SocketException {
      throw ServerException("Connection failed");
    } on FormatException catch (e) {
      throw ServerException("Error ${e.message.toString()}");
    }
  }

  Future<Response> putMethod(String url, dynamic body) async {
    try {
      Response response = await put(url, body);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ServerException("Error ${response.statusText}");
      }
    } on SocketException {
      throw ServerException("Connection failed");
    } on FormatException catch (e) {
      throw ServerException("Error ${e.message.toString()}");
    }
  }

  Future<Response> deleteMethod(String url) async {
    try {
      Response response = await delete(url);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ServerException("Error ${response.statusText}");
      }
    } on SocketException {
      throw ServerException("Connection failed");
    } on FormatException catch (e) {
      throw ServerException("Error ${e.message.toString()}");
    }
  }
}
