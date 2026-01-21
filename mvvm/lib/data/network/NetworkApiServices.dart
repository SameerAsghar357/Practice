import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/app_exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/utils/Utils.dart';

class Networkapiservices extends Baseapiservices {
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    dynamic jsonResponse;

    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 10));

      jsonResponse = getJsonResponse(response);
    } on SocketException {
      throw FetchDataException('Network Error');
    } catch (e) {
      throw FetchDataException(e.toString());
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> getPostApiResponse(String url, dynamic data) async {
    dynamic jsonResponse;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'x-api-key': 'reqres-free-v1'},
        body: data,
      );
      jsonResponse = getJsonResponse(response);
    } on SocketException {
      Utils().toastMessage('No Network Connection');
      throw BadNetworkException('Network Error');
    } catch (e) {
      throw FetchDataException(e.toString());
    }
    return jsonResponse;
  }

  dynamic getJsonResponse(http.Response response) {
    // try {
    switch (response.statusCode) {
      case 200:

        // ignore: non_constant_identifier_names
        dynamic JsonResponse = jsonDecode(response.body);
        debugPrint("${response.statusCode.toInt()}");
        return JsonResponse;

      case 400:
        debugPrint("${response.statusCode.toInt()}");
        throw BadNetworkException(response.body.toString());

      case 500:
        debugPrint("${response.statusCode.toInt()}");

      default:
        debugPrint("${response.statusCode.toInt()}");
        throw FetchDataException(response.body.toString());
    }
    // } catch (e) {
    //   throw FetchDataException("${e.toString()}\n${response.body.toString()}");
    // }
  }
}
