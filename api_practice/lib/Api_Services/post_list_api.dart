import 'dart:convert';

import 'package:api_practice/Models/post_list_model.dart';
import 'package:http/http.dart' as http;
// import 'package:news_app/Models/post_model.dart';

class PostListApi {
  List<Post_List_Model> postList = [];

  final url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post_List_Model>> fetchPostListApi() async {
    final response = await http.get(Uri.parse(url));

    final body = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (var i in body) {
        postList.add(Post_List_Model.fromJson(i));
      }
      return postList;
      // return Post_List_Model.fromJson(body);
    } else {
      return postList;
      // return Post_List_Model.fromJson(body);
    }
  }
}
