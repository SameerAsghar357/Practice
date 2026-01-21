// ignore_for_file: unused_import

import 'dart:convert';
import 'package:api_practice/Models/users_model.dart';
import 'package:http/http.dart' as http;

class UserApi {
  List<Users_Model> userList = [];

  final url = "https://jsonplaceholder.typicode.com/users";

  Future<List<Users_Model>> fetchUserApi() async {
    final response = await http.get(Uri.parse(url));

    final body = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (var i in body) {
        userList.add(Users_Model.fromJson(i));
      }
      return userList;
      // return Post_List_Model.fromJson(body);
    } else {
      return userList;
      // return Post_List_Model.fromJson(body);
    }
  }
}
