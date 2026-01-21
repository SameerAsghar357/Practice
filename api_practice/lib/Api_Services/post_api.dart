import 'dart:convert';

import 'package:api_practice/Models/post_model.dart';
import 'package:http/http.dart' as http;

class PostApi {
  // List<Post_Model> postList = [];

  final url = "https://jsonplaceholder.typicode.com/posts/1";

  Future<Post_Model> fetchPostApi() async {
    final response = await http.get(Uri.parse(url));

    final body = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return Post_Model.fromJson(body);
    } else {
      return Post_Model.fromJson(body);
    }
  }
}
