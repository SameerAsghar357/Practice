import 'package:flutter/cupertino.dart';
import 'package:mvvm/data/api_endPoints.dart';
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiServices.dart';
import 'package:mvvm/model/moviesListModel.dart';

class MLClass {
  Baseapiservices MLAuth = Networkapiservices();

  Future<moviesListModel> moviesList() async {
    try {
      dynamic response = await MLAuth.getGetApiResponse(ApiEndpoints.moviesList_url);
      return response = moviesListModel.fromJson(response);
    } catch (e) {
      debugPrint(e.toString());
      throw FetchDataException(e.toString());
    }
  }
}
