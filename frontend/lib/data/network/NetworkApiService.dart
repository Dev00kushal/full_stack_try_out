// ignore: file_names
import 'dart:convert';
import 'dart:io';

import 'package:blog_application/data/data_expections.dart';
import 'package:blog_application/data/network/baseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  // yo function le cheii api ko url lincha ani responseJson return garxa with error handling yedi internet chaina vane FetchDataException throw garxa

  Future<dynamic> getApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }

    return responseJson;
  }

// yo function le put request garxa ani responseJson return garxa with error handling yedi internet chaina vane FetchDataException throw garxa
  Future<dynamic> putApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .put(
            Uri.parse(url),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }

    return responseJson;
  }

// yo function le post request garxa ani responseJson return garxa with error handling yedi internet chaina vane FetchDataException throw garxa
  @override
  Future<dynamic> postApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(data),
          )
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }

    return responseJson;
  }

// yo function le response lincha ani status code check garxa yedi 200 vayo vane responseJson return garxa else error throw garxa
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 500:
        throw FetchDataException("Server Error");
      default:
        throw FetchDataException(
            "Error occured while Communication with Server with StatusCode : ${response.statusCode.toString()}");
    }
  }
}
