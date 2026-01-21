
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiServices.dart';

class Authentication {
  Baseapiservices auth = Networkapiservices();

  Future<dynamic> loginApi(String url, dynamic data) async {
    // try {
    final response = await auth.getPostApiResponse(url, data);
    return response;
    // } catch (e) {
    // throw FetchDataException(e.toString());
    // print(e.toString());
    // }
  }

  Future<dynamic> signUpApi(String url, dynamic data) async {
    // try {
    final response = await auth.getPostApiResponse(url, data);
    return response;
    // } catch (e) {
    // print(e.toString());
    // throw FetchDataException(e.toString());
    // }
  }
}
