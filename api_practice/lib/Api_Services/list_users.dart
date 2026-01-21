import 'dart:convert';

import 'package:api_practice/Models/list_users_model.dart';
import 'package:http/http.dart' as http;

class ListUsers {
  List<List_Users_Model> usersList = [];

  Future<List<List_Users_Model>> fetchListUsersApi() async {
    final url = "https://fakestoreapi.com/users";
    final response = await http.get(Uri.parse(url));

    final data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (var i in data) {
        usersList.add(List_Users_Model.fromJson(i));
      }
      return usersList;
    } else {
      throw usersList;
    }
  }
}
