import 'package:api_practice/Api_Services/post_list_api.dart';
import 'package:api_practice/Models/post_list_model.dart';
import 'package:flutter/material.dart';

class PostListApiChecking extends StatelessWidget {
  const PostListApiChecking({super.key});

  @override
  Widget build(BuildContext context) {
    PostListApi postListApi = PostListApi();
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Checking Page', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder(
                future: postListApi.fetchPostListApi(),
                builder:
                    (context, AsyncSnapshot<List<Post_List_Model>> snapshot) {
                      if (!snapshot.hasData) {
                        return CircularProgressIndicator();
                      } else {
                        return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        snapshot.data![index].id.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Title:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data![index].title.toString(),
                                    ),
                                    Text(
                                      'Body:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(snapshot.data![index].body.toString()),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
