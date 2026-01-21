import 'package:api_practice/Api_Services/post_api.dart';
import 'package:api_practice/Models/post_model.dart';
import 'package:flutter/material.dart';

class PostApiChecking extends StatelessWidget {
  const PostApiChecking({super.key});

  @override
  Widget build(BuildContext context) {
    PostApi postApi = PostApi();
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
                future: postApi.fetchPostApi(),
                builder: (context, AsyncSnapshot<Post_Model> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text(snapshot.data!.id.toString()),
                                Text(
                                  'Title:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(snapshot.data!.title.toString()),
                                Text(
                                  'Body:',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(snapshot.data!.body.toString()),
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
